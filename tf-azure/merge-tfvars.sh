#!/bin/bash

# merge-tfvars.sh - Merge terraform.tfvars files from parent directories
# Usage: ./merge-tfvars.sh <resource_name_or_path>
# Examples:
#   ./merge-tfvars.sh rg-apps                    # Find and use rg-apps directory
#   ./merge-tfvars.sh swa-ScottLowryNet          # Find and use swa-ScottLowryNet directory
#   ./merge-tfvars.sh subscriptions/prod-sub     # Use specific path
# A resource name or path is required

set -e

# Function to print output
print_info() {
    echo "INFO: $1"
}

print_success() {
    echo "SUCCESS: $1"
}

print_warning() {
    echo "WARNING: $1"
}

print_error() {
    echo "ERROR: $1"
}

# Function to find directory by name within tf-azure
find_resource_dir() {
    local resource_name="$1"
    local script_dir=$(dirname "$(realpath "$0")")
    
    # Search for directories with the given name under tf-azure
    local found_dirs=$(find "$script_dir" -type d -name "$resource_name" 2>/dev/null)
    
    if [[ -z "$found_dirs" ]]; then
        print_error "Resource directory '$resource_name' not found under tf-azure"
        exit 1
    fi
    
    # If multiple directories found, show them and exit
    local dir_count=$(echo "$found_dirs" | wc -l)
    if [[ $dir_count -gt 1 ]]; then
        print_error "Multiple directories found with name '$resource_name':"
        echo "$found_dirs"
        print_error "Please specify the full path instead"
        exit 1
    fi
    
    echo "$found_dirs"
}

# Get target directory
if [[ $# -eq 0 ]]; then
    # No argument provided, show usage and exit
    print_error "No resource name or path provided"
    echo ""
    echo "Usage: $0 <resource_name_or_path>"
    echo ""
    echo "Examples:"
    echo "  $0 rg-apps                    # Find and use rg-apps directory"
    echo "  $0 swa-ScottLowryNet          # Find and use swa-ScottLowryNet directory"
    echo "  $0 subscriptions/prod-sub     # Use specific path"
    echo ""
    exit 1
elif [[ "$1" == *"/"* ]] || [[ -d "$1" ]]; then
    # Argument contains slash or is an existing directory, treat as path
    TARGET_DIR="$1"
else
    # Argument is just a name, search for it
    print_info "Searching for resource directory: $1"
    TARGET_DIR=$(find_resource_dir "$1")
    print_info "Found: $TARGET_DIR"
fi

TARGET_DIR=$(realpath "$TARGET_DIR")
print_info "Merging terraform.tfvars files for: $TARGET_DIR"

# Find all terraform.tfvars files in the path hierarchy
TFVARS_FILES=()
CURRENT_DIR="$TARGET_DIR"

# Walk up the directory tree looking for terraform.tfvars files
while [[ "$CURRENT_DIR" != "/" ]]; do
    # Only include terraform.tfvars
    if [[ -f "$CURRENT_DIR/terraform.tfvars" ]]; then
        TFVARS_FILES+=("$CURRENT_DIR/terraform.tfvars")
        print_info "Found: $CURRENT_DIR/terraform.tfvars"
    fi
    
    # Stop if we've reached the tf-azure directory
    if [[ $(basename "$CURRENT_DIR") == "tf-azure" ]]; then
        break
    fi
    
    CURRENT_DIR=$(dirname "$CURRENT_DIR")
done

# Check if we found any files
if [[ ${#TFVARS_FILES[@]} -eq 0 ]]; then
    print_warning "No terraform.tfvars files found in directory hierarchy"
    exit 0
fi

# Reverse the array to process from root to target (parent to child)
REVERSED_FILES=()
for (( i=${#TFVARS_FILES[@]}-1; i>=0; i-- )); do
    REVERSED_FILES+=("${TFVARS_FILES[i]}")
done

# Create merged file (directly update terraform.tfvars)
MERGED_FILE="$TARGET_DIR/terraform.tfvars"
TEMP_FILE=$(mktemp)
VARS_TEMP=$(mktemp)
SOURCES_TEMP=$(mktemp)

print_info "Updating terraform.tfvars with merged variables: $MERGED_FILE"

# Extract and merge variables from all files
for file in "${REVERSED_FILES[@]}"; do
    print_info "Processing: $file"
    
    # Extract variables using awk (more reliable than bash regex)
    awk '
    # Skip comments and empty lines
    /^[[:space:]]*#/ { next }
    /^[[:space:]]*$/ { next }
    
    # Match variable assignments
    /^[[:space:]]*[a-zA-Z_][a-zA-Z0-9_]*[[:space:]]*=/ {
        # Remove leading/trailing whitespace
        line = $0
        gsub(/^[[:space:]]+|[[:space:]]+$/, "", line)
        
        # Split on first =
        eq_pos = index(line, "=")
        if (eq_pos > 0) {
            var_name = substr(line, 1, eq_pos-1)
            var_value = substr(line, eq_pos+1)
            
            # Trim whitespace from var_name and var_value
            gsub(/^[[:space:]]+|[[:space:]]+$/, "", var_name)
            gsub(/^[[:space:]]+|[[:space:]]+$/, "", var_value)
            
            if (var_name != "" && var_value != "") {
                print var_name "=" var_value
            }
        }
    }
    ' "$file" > "$VARS_TEMP.current"
    
    # Process each variable from current file
    while IFS='=' read -r var_name var_value; do
        if [[ -n "$var_name" && -n "$var_value" ]]; then
            print_info "  Variable: $var_name = $var_value"
            
            # Remove existing entry for this variable
            if [[ -f "$VARS_TEMP" ]]; then
                grep -v "^$var_name=" "$VARS_TEMP" > "$VARS_TEMP.new" 2>/dev/null || touch "$VARS_TEMP.new"
                mv "$VARS_TEMP.new" "$VARS_TEMP"
            fi
            if [[ -f "$SOURCES_TEMP" ]]; then
                grep -v "^$var_name=" "$SOURCES_TEMP" > "$SOURCES_TEMP.new" 2>/dev/null || touch "$SOURCES_TEMP.new"
                mv "$SOURCES_TEMP.new" "$SOURCES_TEMP"
            fi
            
            # Add new entry
            echo "$var_name=$var_value" >> "$VARS_TEMP"
            echo "$var_name=$file" >> "$SOURCES_TEMP"
        fi
    done < "$VARS_TEMP.current"
    
    # Clean up temporary file
    rm -f "$VARS_TEMP.current"
done

# Create final merged file
cat > "$TEMP_FILE" << EOF
# terraform.tfvars - merged from parent directories
# Last updated: $(date)
# Variables inherited from:
EOF

for file in "${REVERSED_FILES[@]}"; do
    echo "#   - $file" >> "$TEMP_FILE"
done

echo "" >> "$TEMP_FILE"
echo "# Final merged variables:" >> "$TEMP_FILE"

# Write all variables to merged file
if [[ -f "$VARS_TEMP" ]]; then
    while IFS='=' read -r var_name var_value; do
        if [[ -n "$var_name" && -n "$var_value" ]]; then
            echo "$var_name = $var_value" >> "$TEMP_FILE"
        fi
    done < "$VARS_TEMP"
fi

# Move temp file to final location
mv "$TEMP_FILE" "$MERGED_FILE"

print_success "Updated terraform.tfvars: $MERGED_FILE"
print_info "Variables merged:"

if [[ -f "$VARS_TEMP" ]]; then
    while IFS='=' read -r var_name var_value; do
        if [[ -n "$var_name" && -n "$var_value" ]]; then
            source_file=$(grep "^$var_name=" "$SOURCES_TEMP" | head -1 | cut -d'=' -f2-)
            echo "  $var_name = $var_value (from: $source_file)"
        fi
    done < "$VARS_TEMP"
fi

# Cleanup temporary files
rm -f "$VARS_TEMP" "$SOURCES_TEMP"

echo ""
print_info "Ready to use:"
print_info "  cd $TARGET_DIR"
print_info "  terraform plan"
print_info "  terraform apply"
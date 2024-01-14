#!/bin/bash

# Constants
CONTAINER_NAME="your-container-name"
STORAGE_ACCOUNT_NAME="your-storage-account-name"

# Check Azure CLI and Authentication
if ! command -v az &> /dev/null; then
    echo "Azure CLI not installed. Please install it."
    exit 1
fi

# Ensure user is logged in
if ! az account show &> /dev/null; then
    echo "Not logged in to Azure. Please use 'az login' to login."
    exit 1
fi

# File Upload Function
upload_file() {
    local file_path=$1
    local file_name=$(basename "$file_path")

    # Check if the file exists in the cloud
    file_exists=$(az storage blob exists --account-name $STORAGE_ACCOUNT_NAME --container-name $CONTAINER_NAME --name "$file_name" --output tsv)
    if [[ $file_exists == "True" ]]; then
        read -p "File $file_name already exists. Overwrite (o), skip (s), rename (r)? " choice
        case "$choice" in
            o|O ) ;;
            s|S ) echo "Skipping $file_name"; return;;
            r|R ) read -p "Enter new filename: " new_name
                  file_name=$new_name;;
            * ) echo "Invalid choice"; return;;
        esac
    fi

    # Upload file
    echo "Uploading $file_name..."
    az storage blob upload --account-name $STORAGE_ACCOUNT_NAME --container-name $CONTAINER_NAME --file "$file_path" --name "$file_name"

    # Generate shareable link
    az storage blob url --account-name $STORAGE_ACCOUNT_NAME --container-name $CONTAINER_NAME --name "$file_name" --output tsv
}

# Loop over each file provided in arguments
for file in "$@"; do
    if [[ ! -f "$file" ]]; then
        echo "File not found: $file"
        continue
    fi
    upload_file "$file"
done



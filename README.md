# CloudUploader

CloudUploader is a simple, efficient command-line tool for uploading files to Azure Blob Storage. It's designed to provide a seamless experience for quickly transferring files to the cloud with added functionality like handling multiple files, checking for duplicates, and generating shareable links.

## Overview

CloudUploader allows users to upload files to a specified container in Azure Blob Storage. It supports multiple file uploads, checks for file existence in the cloud, and can generate shareable links post-upload.

## Prerequisites

- **Azure CLI**: The tool uses Azure CLI for interacting with Azure Blob Storage. Ensure you have Azure CLI installed and configured on your system. [Azure CLI Installation Guide](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli)
- **Bash Shell**: Since this is a Bash script, a Unix-like environment is required for execution.
- **Azure Blob Storage Account**: You must have an Azure Blob Storage account and a container where files will be uploaded.

## Setup

1. **Clone the Repository**: Clone or download the script to your local machine.
2. **Configure the Script**: Open the script in a text editor and replace `your-container-name`, `your-storage-account-name`, and `your-storage-account-key` with your actual Azure Blob Storage details.
3. **Make the Script Executable**: Run `chmod +x clouduploader.sh` to make the script executable.

## Usage

To upload a file, use the script followed by the path to the file:

```bash
./clouduploader.sh /path/to/file.txt
```

To upload multiple files, list them all:

```bash
./clouduploader.sh /path/to/file1.txt /path/to/file2.jpg /path/to/file3.pdf
```

The script will handle each file individually, checking for duplicates in the cloud, and allowing you to choose actions for each.

### Generating Shareable Links

After a successful upload, the script automatically generates a shareable link for each file.

### Checking for Duplicates

If a file with the same name exists in the cloud, the script will prompt you to:

- **Overwrite (o)**: Replace the existing file.
- **Skip (s)**: Ignore and move to the next file.
- **Rename (r)**: Provide a new name for the file being uploaded.

## Common Issues and Troubleshooting

- **Authentication Error**: Ensure you're logged into Azure CLI with `az login` and have the necessary permissions.
- **File Not Found**: Check if the provided file path is correct. The script cannot upload files that do not exist or paths that are mistyped.
- **Permission Denied**: Run the script with sufficient permissions. If on Linux or macOS, using `sudo` might be necessary.
- **Script Not Executing**: Make sure the script is marked as executable with `chmod +x clouduploader.sh`.
- **Duplicate File Issue**: If the script doesn't prompt for action on duplicate files, ensure the Azure CLI command for checking file existence is working correctly.

## Support

For additional help or to report issues, please open an issue in the project's issue tracker.

---

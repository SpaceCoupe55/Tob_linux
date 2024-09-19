#!/bin/bash

# Prompt the user for input
echo "Enter the public IP address of the EC2 instance:"
read ec2_ip
echo "Enter the path to your SSH key pair file (e.g., keypair.pem):"
read key_file
echo "Enter the username (default: ubuntu):"
read username

# Set default username to 'ubuntu' if not provided
if [ -z "$username" ]; then
    username="ubuntu"
fi

# Prompt for transfer direction
echo "Do you want to upload or download? (Enter 'upload' or 'download'):"
read direction

# Handle upload
if [ "$direction" == "upload" ]; then
    echo "Enter the local file path to upload:"
    read local_file
    echo "Enter the remote file path where the file will be uploaded:"
    read remote_path

    # Upload the file to EC2 instance
    scp -i "$key_file" "$local_file" "$username@$ec2_ip:$remote_path"

# Handle download
elif [ "$direction" == "download" ]; then
    echo "Enter the remote file path to download:"
    read remote_file
    echo "Enter the local path where the file will be saved:"
    read local_path

    # Download the file from EC2 instance
    scp -i "$key_file" "$username@$ec2_ip:$remote_file" "$local_path"

else
    echo "Invalid option. Please enter 'upload' or 'download'."
fi


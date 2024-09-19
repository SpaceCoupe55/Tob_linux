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

# Establish the SSH connection
ssh -i "$key_file" "$username@$ec2_ip"


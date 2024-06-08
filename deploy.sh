#!/bin/bash

# Deployment script for deploying portfolio to AWS S3
# Ensure AWS CLI is installed and configured with appropriate credentials

# Variables
S3_BUCKET_NAME="your-bucket-name"
LOCAL_PORTFOLIO_DIR="/path/to/your/portfolio"
AWS_PROFILE="your-aws-profile"  # Optional: Use if you have multiple AWS profiles configured

# Function to check if AWS CLI is installed
check_aws_cli() {
    if ! command -v aws &> /dev/null; then
        echo "AWS CLI is not installed. Please install it before running this script."
        exit 1
    fi
}

# Function to upload files to S3 bucket
upload_to_s3() {
    echo "Uploading files to S3 bucket..."
    if [ -n "$AWS_PROFILE" ]; then
        aws s3 sync $LOCAL_PORTFOLIO_DIR s3://$S3_BUCKET_NAME --acl public-read --profile $AWS_PROFILE
    else
        aws s3 sync $LOCAL_PORTFOLIO_DIR s3://$S3_BUCKET_NAME --acl public-read
    fi

    if [ $? -eq 0 ]; then
        echo "Upload completed successfully."
    else
        echo "Upload failed. Please check your AWS credentials and try again."
        exit 1
    fi
}

# Function to ensure files are publicly accessible
set_permissions() {
    echo "Setting permissions for files in S3 bucket..."
    if [ -n "$AWS_PROFILE" ]; then
        aws s3 cp --recursive --acl public-read s3://$S3_BUCKET_NAME/ s3://$S3_BUCKET_NAME/ --profile $AWS_PROFILE
    else
        aws s3 cp --recursive --acl public-read s3://$S3_BUCKET_NAME/ s3://$S3_BUCKET_NAME/
    fi
}

# Main function
main() {
    check_aws_cli
    upload_to_s3
    set_permissions
}

# Execute main function
main

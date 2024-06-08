# AWS First Steps

Welcome to the AWS First Steps repository!

This repository is dedicated to documenting the journey into cloud computing with Amazon Web Services (AWS). Whether you're new to the cloud or a seasoned professional, this space is for sharing learning experiences, insights, challenges, and triumphs related to AWS.

## Getting Started

1. **AWS Account**: Set up AWS Management console.

2. **S3 Bucket**: Create an S3 bucket where you'll host your static website. Make sure the bucket name matches your domain name or subdomain name (if you plan to use a custom domain).

3. **Configure Bucket for Static Website Hosting**: In the properties of your S3 bucket, enable static website hosting and set the index document (usually "index.html").

4. **Upload Your Files**: Upload your HTML, CSS, and any other assets (like images) to your S3 bucket.

5. **Set Permissions**: Make sure your files are publicly accessible by adjusting bucket policies or setting permissions on individual files.

6. **DNS Configuration (Optional)**: If you're using a custom domain, configure your DNS settings to point to your S3 bucket. This involves creating a CNAME or Alias record that points to your bucket's endpoint.

7. **Testing**: Once everything is set up, test your website by accessing the S3 bucket URL (or your custom domain if you've configured it).

8. **HTTPS (Optional)**: Consider enabling HTTPS for your website. You can do this using AWS Certificate Manager (ACM) to provision an SSL/TLS certificate and then configure CloudFront in front of your S3 bucket to handle HTTPS requests.
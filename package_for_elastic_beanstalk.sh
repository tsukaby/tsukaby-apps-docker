#!/bin/sh

app_sha1=$1

file_name=tsukaby-apps-${app_sha1}.zip

# Create zip
cd eb
zip -r ../${file_name} ./* .ebextensions
cd ..

# Upload
aws s3 mv ${file_name} s3://tsukaby-apps/binary/

# Create eb version
aws elasticbeanstalk create-application-version \
  --application-name tsukaby-apps \
  --version-label ${app_sha1} \
  --source-bundle S3Bucket="tsukaby-apps",S3Key=binary/${file_name}
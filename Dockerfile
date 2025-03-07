# Use the official Alpine Linux base image
FROM alpine:latest

ARG VERSION=azcopy_linux_amd64_10.28.0

# Update the package index and install Python 3
RUN apk update && apk add --no-cache python3
RUN apk --update add --virtual build-dependencies --no-cache wget tar 
RUN apk --update add libc6-compat ca-certificates
RUN wget -O azcopyv10.tar https://aka.ms/downloadazcopy-v10-linux && \
    tar -xf azcopyv10.tar && \
    mkdir /app && \
    mv ${VERSION}/azcopy /app/azcopy && \
    rm -rf azcopy* && \
    apk del build-dependencies

# Optional: Install a specific Python package
# RUN apk add --no-cache py-pip
# RUN pip install <package_name>

# Set the working directory
WORKDIR /app

# Copy the application files
# COPY . .

# Define the command to run the application
ENTRYPOINT ["tail", "-f", "/dev/null"]
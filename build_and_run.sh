#!/bin/bash

# Change to the current directory
cd "$(dirname "$0")"

# Create a build directory if it doesn't exist
mkdir -p build

# Change to the build directory
cd build

# Clean the build directory
rm -rf *

# Run CMake to generate the build files
cmake ..

# Build the project
make

# Run the project if the build was successful
if [ $? -eq 0 ]; then
    cd ..
    ./bin/Debug/uuid_lic
else
    echo "Build failed. Cannot run the project."
fi

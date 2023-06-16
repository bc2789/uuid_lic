#!/bin/bash
#Zero 0 value is success 

# Change to the current directory
cd "$(dirname "$0")"

# Create a build directory if it doesn't exist
mkdir -p build

# Change to the build directory
cd build

# Clean the build directory
rm -rf *

# Run the cmake command
cmake ..

# Capture the return value
return_value=$?

# Check the return value
if [ $return_value -ne 0 ]; then
  echo "CMake command failed with exit status $return_value."
  exit $return_value
fi

# Continue script execution if cmake command succeeds
echo "CMake command executed successfully."


# Build the project
make

# Capture the return value
return_value=$?

# Check the return value
if [ $return_value -ne 0 ]; then
  echo "Make command failed with exit status $return_value."
  exit $return_value
fi

# Continue script execution if make command succeeds
echo "Make command executed successfully."

# Run the project if the build was successful
cd ..
./bin/Debug/uuid_lic

# Capture the return value
return_value=$?

# Check the return value
if [ $return_value -ne 0 ]; then
  echo "Program failed with status $return_value."
  exit $return_value
fi
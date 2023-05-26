cmake_minimum_required(VERSION 3.0.0)
project(uuid_lic VERSION 0.1.0)

set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_COMPILE_FEATURES ON)
set(CMAKE_CXX_EXTENSIONS ON)
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_BUILD_TYPE Debug)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/bin/${CMAKE_BUILD_TYPE})  # Set the output directory

include(CTest)
enable_testing()

add_executable(uuid_lic main.cpp)

message(${CMAKE_RUNTIME_OUTPUT_DIRECTORY})
# Link against OpenSSL Crypto library
find_package(OpenSSL REQUIRED)

# Add the OpenSSL include directories
target_include_directories(uuid_lic PRIVATE ${OPENSSL_INCLUDE_DIR})

# Link against the OpenSSL Crypto library
target_link_libraries(uuid_lic PRIVATE OpenSSL::Crypto)
# Link against the OpenSSL libraries
target_link_libraries(uuid_lic PRIVATE ${OPENSSL_CRYPTO_LIBRARY} ${OPENSSL_SSL_LIBRARY} crypto)

set(CPACK_PROJECT_NAME ${PROJECT_NAME})
set(CPACK_PROJECT_VERSION ${PROJECT_VERSION})
include(CPack)

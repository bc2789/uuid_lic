#include <openssl/sha.h>
#include <iostream>
#include <string>
#include<type_traits>
std::string CalculateSHA256(const std::string& data)
{
    unsigned char hash[SHA256_DIGEST_LENGTH];
    SHA256(reinterpret_cast<const unsigned char*>(data.c_str()), data.length(), hash);

    std::string sha256Hash;
    for (int i = 0; i < SHA256_DIGEST_LENGTH; ++i)
    {
        char hex[3];
        sprintf(hex, "%02x", hash[i]);
        sha256Hash += hex;
    }

    return sha256Hash;
}

int main()
{
    std::string data = "Hello, World!";
    std::string sha256Hash = CalculateSHA256(data);

    std::cout << "SHA-256 Hash: " << sha256Hash << std::endl;

    return 0;
}

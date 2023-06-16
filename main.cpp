#include <cstdlib>
#include <iostream>
#include <omp.h>

int main() {
    int unsuccess = false;
    #pragma omp parallel
    {
        int thread_id = omp_get_thread_num();
        printf("Hello from thread %d\n", thread_id);
        std::cout << "Hello Thread" << std::endl;
    }
    if(unsuccess) return EXIT_FAILURE;
    std::cout << "Hello Thread" << std::endl;
    return EXIT_SUCCESS;
}

cmake_minimum_required(VERSION 3.17.5)
project(bug_test CUDA CXX)

add_subdirectory(thrust)
add_subdirectory(thrust/dependencies/cub)

add_executable(bug_test main.cu)

set_target_properties(bug_test PROPERTIES
   CUDA_ARCHITECTURES 50 61 72 75 86
)

target_compile_features(bug_test PRIVATE 
   cuda_std_14
)

target_link_libraries(bug_test PRIVATE 
   /usr/local/libtorch/lib/libtorch.so 
   -Wl,--no-as-needed,"/usr/local/libtorch/lib/libtorch_cuda.so"
   /usr/local/cuda/lib64/libcudart.so 
   Thrust::Thrust
   CUB::CUB
)


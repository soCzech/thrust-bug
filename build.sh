#!/bin/bash
rm -rf build
mkdir -p build
cd build
PATH=$PATH:/usr/local/cuda/bin cmake .. -DCMAKE_BUILD_TYPE=RelWithDebInfo -DCMAKE_VERBOSE_MAKEFILE:BOOL=ON
cmake --build . --parallel 4
cd ..
#include <iostream>
#include <thrust/host_vector.h>
#include <thrust/device_vector.h>

// #define CPP_COMPARE

int main() 
{
    for (size_t NUM = 128; NUM < 32768; NUM+=128) 
    {
        for (int run = 0; run < 1; run++) {
            thrust::host_vector<int> h(NUM);
            thrust::device_vector<int> d(NUM);
            for (int i = 0; i < NUM; i++) {
                int random_number = rand() * 1000;
                h[i] = random_number;
                d[i] = random_number;
            }
            thrust::sort(h.begin(), h.end());
            thrust::sort(d.begin(), d.end());
    
#ifdef CPP_COMPARE
            int last = 0;
            bool sort_ok = true, match = true;
            for (int i = 0; i < NUM; i++) {
                if (i != 0) {
                    if (last > d[i]) {
                        sort_ok = false;
                    }
                }
                last = d[i];
                if(d[i] != h[i]) {
                    match = false;
                }
            }
#else 
            thrust::host_vector<int> d_host(d.begin(), d.end());
            bool sort_ok = thrust::equal(
                d_host.begin(), d_host.end() - 1, d_host.begin() + 1,	
                thrust::less_equal<int>());
            bool match = thrust::equal(d_host.begin(), d_host.end(), h.begin());
#endif
            std::cout << "RUN " << run << ", NUM " << NUM;
            std::cout << ", dev_ptr " << static_cast<void*>(thrust::raw_pointer_cast(d.data())) << ": ";
            if (sort_ok && match) { std::cout << "OK! "; }
            if (!sort_ok) { std::cout << "Wrong sort! "; }
            if (!sort_ok) { std::cout << "Host and device vector doesn't match! "; }
            std::cout << std::endl;
        }
    }

    return 0;
}

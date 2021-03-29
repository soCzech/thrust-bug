### Build & Run
```
git clone https://github.com/soCzech/thrust-bug.git --recursive
cd thrust-bug
docker build -t test .
docker run -it --rm --gpus 1 -v $(pwd):/tmp -w /tmp test bash
bash build.sh
bash run.sh
```
### Expected Output
```
RUN 0, NUM 128, dev_ptr 0x7f6637c00000: OK! 
...
RUN 0, NUM 5376, dev_ptr 0x7f6637c00000: OK! 
RUN 0, NUM 5504, dev_ptr 0x7f6637c00000: Wrong sort! Host and device vector doesn't match! 
...
RUN 0, NUM 7680, dev_ptr 0x7f6637c00000: Wrong sort! Host and device vector doesn't match! 
RUN 0, NUM 7808, dev_ptr 0x7f6637c00000: OK! 
...
RUN 0, NUM 10880, dev_ptr 0x7f6637c00000: Wrong sort! Host and device vector doesn't match! 
...
```

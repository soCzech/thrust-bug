### Build & Run
```
git clone https://github.com/soCzech/thrust-bug.git --recursive
cd thrust-bug
docker build -t test .
docker run -it --rm --gpus 1 -v $(pwd):/tmp -w /tmp test bash
bash build.sh
bash run.sh
```

# cogwerx-nvidia-amd64

## Darknet

### Setup on AMD 64, with NVIDIA GPU
0. (If you wish to build the container yourself) Clone this repo
1. Install [docker-ce](https://docs.docker.com/install/linux/docker-ce/ubuntu/) or [docker-ee](https://docs.docker.com/install/linux/docker-ee/ubuntu/)
2. Install [NVIDIA Drivers](https://docs.nvidia.com/cuda/cuda-installation-guide-linux/index.html#ubuntu-installation) and [CUDA libraries](https://developer.nvidia.com/cuda-downloads?target_os=Linux&target_arch=x86_64&target_distro=Ubuntu) (at least CUDA version 9.0)
3. Install [nvidia-docker](https://github.com/NVIDIA/nvidia-docker) and install/enable [nvidia container runtime](https://github.com/nvidia/nvidia-container-runtime#installation).  You can optionally set nvidia as the default runtime as shown in this example `/etc/docker/daemon.json`:
```
{
    "runtimes": {
        "nvidia": {
            "path": "nvidia-container-runtime",
            "runtimeArgs": []
        }
    },
    "default-runtime": "nvidia"
}
```
### Run (with USB webcam, or without)
Assuming you have an attached webcam, say via USB (not an itegrated one, which is typically cam 0 (/dev/video0))    
`xhost + && docke --privileged -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix --rm openhorizon/amd64-nvidia-darknet:cuda10.0-cudnn7-16.04 ./darknet detector demo cfg/coco.data cfg/yolov3.cfg yolov3.weights`    

To test on one picture, shows the picture in Xwindows (works even if you don't have X)    
`xhost + && docker run --privileged -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix --rm openhorizon/amd64-nvidia-darknet:cuda10.0-cudnn7-16.04 ./darknet yolo test cfg/yolov3-tiny.cfg yolov3-tiny.weights data/person.jpg`   


### Reference
- PJ Reddie's Darknet: https://pjreddie.com/darknet/yolo/

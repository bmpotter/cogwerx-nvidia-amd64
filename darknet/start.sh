# Start command for darknet yolov3
#

if [ -z "$DARKNET_CAMERA" ]; then
        DARKNET_CAMERA=0
fi

./darknet detector demo -c $DARKNET_CAMERA cfg/coco.data cfg/yolov3.cfg yolov3.weights

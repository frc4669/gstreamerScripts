
gst-launch-1.0 videomixer name=mix \
 sink_0::xpos=0   sink_0::ypos=0 \
 sink_1::xpos=0   sink_1::ypos=480 \
! queue ! omxh264enc control-rate=2 bitrate=400000 ! 'video/x-h264, stream-format=(string)byte-stream' \
! h264parse config-interval=1 \
! rtph264pay mtu=1400 \
! udpsink host=10.46.69.50 port=554 sync=false async=false \
v4l2src device=/dev/video0 \
! video/x-raw,width=640,height=480,framerate=30/1 \
! mix.sink_0 \
v4l2src device=/dev/video1 \
! video/x-raw,width=640,height=480,framerate=30/1 \
! mix.sink_1

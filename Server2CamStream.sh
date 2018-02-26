gst-launch-1.0 -e -v videomixer name=mix \
 sink_0::xpos=0   sink_0::ypos=0 \
 sink_1::xpos=0   sink_1::ypos=480 \
! omxh264enc control-rate=2 bitrate=40000 ! 'video/x-h264, stream-format=(strin$
! h264parse\
! rtph264pay\
! udpsink host=10.46.69.5 port=554 \
v4l2src device=/dev/video0 \
! 'video/x-raw,format=(string)I420,width=(int)640,height=(int)480,framerate=(fr$
! mix.sink_0 \
v4l2src device=/dev/video1 \
! 'video/x-raw,format=(string)I420,width=(int)640,height=(int)480,framerate=(fr$
! mix.sink_1

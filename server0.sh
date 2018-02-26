
gst-launch-1.0 -v v4l2src device=/dev/video0 \
! videoscale \
! video/x-raw, width=640, height=360, framerate=30/1 \
! omxh264enc control-rate=2 bitrate=1500 ! 'video/x-h264, stream-format=(string)byte-stream' \
! h264parse config-interval=1 ! rtph264pay mtu=1400 \
! udpsink host=10.46.69.5 port=5804 sync=false async=false

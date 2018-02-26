gst-launch-1.0 -v -e v4l2src device=/dev/video0 -v !\
     'video/x-raw, format=(string)I420, width=(int)640, height=(int)480' !\
     omxh264enc bitrate=40000  ! 'video/x-h264, stream-format=(string)byte-stream' !\
     h264parse ! rtph264pay ! udpsink host=10.46.69.5 port=554

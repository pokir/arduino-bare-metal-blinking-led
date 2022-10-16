#!/usr/bin/env python3

# From: https://stackoverflow.com/a/49384222

import sys
import serial


com = serial.Serial(sys.argv[1], 1200)
com.close()

# To use (while loop from https://stackoverflow.com/a/46040407):
'''
python3 ./reset.py "/dev/ttyACM0"
while :; do
  sleep 0.5
  [ -c "${ARDUINO_UPLOAD_PORT}" ] && break
done
'''

# Then run avrdude

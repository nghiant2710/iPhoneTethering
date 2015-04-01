#!/bin/bash

modprobe fuse
modprobe ipheth
udevd &
usbmuxd &
bash

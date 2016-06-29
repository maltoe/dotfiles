#!/bin/bash
if [[ "$1" = "off" ]]; then
  xrandr --output VGA1 --off
else
  xrandr --output VGA1 --mode 1920x1080 --right-of LVDS1
fi

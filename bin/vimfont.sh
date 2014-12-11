#!/bin/bash

if [ "x$1" = "xreset" ]; then
  printf "\33]50;xft:Inconsolata:antialias=true:hinting=true:pixelsize=18\007"
else
  printf "\33]50;xft:Inconsolata:bold:antialias=true:hinting=true:pixelsize=14\007"
fi



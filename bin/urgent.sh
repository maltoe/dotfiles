#!/bin/bash

if [[ $_ != $0 ]]; then
  echo "Setting prompt of this bell to always bell..."
  export PS1="$PS1\a"
else
  echo -en "\a"
fi

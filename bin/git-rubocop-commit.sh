#!/bin/bash

# Thanks to Christoph.

if [ $# -ne 0 ] && ([[ " $@" =~ [[:space:]]-a ]] || [[ "$@" =~ --all ]]); then
  SUCCESS=0

  OUTPUT=$(rubocop-git --staged 2>&1)
  if [ $? -ne 0 ]; then
    SUCCESS=1
    echo -e "\033[0;32mrubocop offenses in staged changes:\033[0m"
    echo "$OUTPUT"
  fi

  OUTPUT=$(rubocop-git 2>&1)
  if [ $? -ne 0 ]; then
    SUCCESS=1
    if [ $SUCCESS -eq 1 ]; then echo; fi
    echo -e "\033[0;31mrubocop offenses in unstaged changes:\033[0m"
    echo "$OUTPUT"
  fi

  if [ $SUCCESS -eq 0 ]; then
    git commit $@
  fi
else
  rubocop-git --cached && git commit $@
fi

#!/usr/bin/env zsh

# Really bad drumming with bells in zsh

while true; do
  echo "\a"
  sleep $((($RANDOM) * (0.1 / 32767) + 0.1))
done

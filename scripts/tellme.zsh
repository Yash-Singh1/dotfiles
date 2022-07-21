#!/usr/bin/env zsh

$@

for i in $(seq 1 10); do
  echo -ne '\007'
  sleep 0.5
done

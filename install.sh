#!/usr/bin/env bash

for d in $(ls -d */); do
  stow --no-folding -t ~ $d
done

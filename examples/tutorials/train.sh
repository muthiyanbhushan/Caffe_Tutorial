#!/usr/bin/env sh
set -e

TOOLS=./build/tools

$TOOLS/caffe train \
  --solver=/home/bhushan/caffe/models/tutorials/solver.prototxt $@


#!/bin/bash
FILES=/home/ec2-user/pdflatex-lambda/tlsb-packages/*
for f in $FILES
do
  echo "Processing $f"
  # take action on each file. $f store current file name
  rpm2cpio $f | cpio -idmv
done

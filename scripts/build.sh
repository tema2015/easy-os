#!/bin/bash
set -e

echo "=== Easy OS build started ==="

WORKDIR=$(pwd)
BUILD=build
OUTPUT=output

sudo rm -rf $BUILD $OUTPUT
mkdir -p $BUILD $OUTPUT
cd $BUILD

lb config \
  --distribution bookworm \
  --archive-areas "main contrib non-free non-free-firmware" \
  --debian-installer live \
  --binary-images iso-hybrid \
  --bootappend-live "boot=live components quiet splash"

mkdir -p config/package-lists
cp ../config/packages.list config/package-lists/easyos.list.chroot

lb build

mv *.iso ../$OUTPUT/EasyOS-x86_64.iso

echo "=== Easy OS build finished ==="

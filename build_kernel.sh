#!/bin/bash

export ARCH=arm64
export CROSS_COMPILE=~/los_13/prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9/bin/aarch64-linux-android-
mkdir output

make -C $(pwd) O=output j7elte_00_defconfig

mkdir -p output/init
cp init/vmm.elf output/init/vmm.elf

make -C $(pwd) O=output -j64

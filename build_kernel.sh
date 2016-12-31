#!/bin/bash

export ARCH=arm64
export CROSS_COMPILE=~/cm13/prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9/bin/aarch64-linux-android-
mkdir output

make -C $(pwd) O=output j7elte_turbo_defconfig

mkdir -p output/init
cp init/vmm.elf output/init/vmm.elf

make -C $(pwd) O=output -j64

./tools/dtbtool -s 2048 -o output/dt.img -p scripts/dtc/ output/arch/arm64/boot/dts/

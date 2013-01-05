#!/bin/sh

set -e

cd buildroot
make
cp output/images/zImage ../output/kernel_rpi.img
cp output/images/rootfs.cpio.gz ../output/berryterminal.img
cd ..

if [ ! -e output/start.elf ]; then
        echo "Downloading Raspberry Pi firmware"
        git clone --depth 1 git://github.com/raspberrypi/firmware.git 
        cp firmware/boot/start*.elf output
        cp firmware/boot/fixup*.dat output
        cp firmware/boot/bootcode.bin output
fi

echo Build complete. Result is in \'output\' directory


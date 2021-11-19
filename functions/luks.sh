#!/usr/bin/env bash

if [ "$EUID" -ne 0 ]; then
    echo "Please run as root"
    exit 1
fi


while getopts ":c :o" opt; do

    case $opt in
      c)
        sudo umount /mnt/Files && sudo cryptsetup luksClose Files
        ;;
      o)
        sudo cryptsetup luksOpen /dev/sdb5 Files && sudo mount /dev/mapper/Files /mnt/Files
        ;;
      \?)
        echo "Invalid option: -$OPTARG" >&2
        ;;
    esac

done
#!/usr/bin/env bash

if [ "$EUID" -ne 0 ]; then
    echo "luks: Please run as root" >&2
    exit 1
fi


while getopts ":c :o" opt; do

    case $opt in
      c)
        sudo umount /mnt/Files &>/dev/null && sudo cryptsetup luksClose Files || echo "luks: Not mounted" >&2
        exit 0
        ;;
      o)
        sudo cryptsetup luksOpen /dev/sdb5 Files && sudo mount /dev/mapper/Files /mnt/Files
        exit 0
        ;;
      \?)
        echo "luks: Invalid option: -$OPTARG" >&2 && exit 2
        ;;
    esac

done

echo "luks: No option, -o to open, -c to close" >&2 && exit 3

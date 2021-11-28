#!/usr/bin/bash

# removes log files with size greater then 100Mb

for i in $(du -a /var/log/* | sort -hr | tr '\t' ':')
do

    size_file=( $(echo "$i" | tr ':' ' ') )

    size="${size_file[0]}"
    file="${size_file[1]}"

    if [ "$size" -ge 102400 ] && [ -f "$file" ]; then
        rm "$file"
    fi

done

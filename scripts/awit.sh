#!/usr/bin/env bash

symbols='/ - \ | / - \ |'

while true;
    do
        for i in $symbols;
            do
                echo -n -e "\b$i"
                sleep 0.3
            done
    done
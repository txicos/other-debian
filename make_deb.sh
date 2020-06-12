#!/bin/bash
rm -rf packageroot

FILE=listusb.c
if test -f "$FILE"; then
    echo "$FILE exists."
else
    echo "$FILE must be copied to this directory, together with its Makefile"
    echo "Will try to download then. Please Rerun this command to see if it runs"
    curl https://raw.githubusercontent.com/sergioprado/listusb/master/Makefile > Makefile
    curl https://raw.githubusercontent.com/sergioprado/listusb/master/listusb.c > listusb.c
    exit
fi

make

if [ $? -eq 0 ]; then
    echo OK
    # in order to build debian package we need a directory structure as below
    mkdir packageroot
    mkdir -p packageroot/DEBIAN

    cp CONTROL packageroot/DEBIAN/control


    mkdir -p packageroot/usr/local/bin
    cp listusb packageroot/usr/local/bin

    #create debian package
    dpkg-deb -b packageroot listusb_all.deb
    rm -rf packageroot
else
    echo FAIL
    echo "Make has failed, check compilation problems"
fi

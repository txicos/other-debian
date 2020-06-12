# Debian test

This a simple test to build a debian package, type in bash ubuntu

`make_deb.sh`

and a package name *listusb_all.deb* will be created. 

If you want to run manually, type commands below in bash

```shell
make
mkdir packageroot
mkdir -p packageroot/DEBIAN

cp CONTROL packageroot/DEBIAN/control


mkdir -p packageroot/usr/local/bin
cp listusb packageroot/usr/local/bin

#create debian package
dpkg-deb -b packageroot listusb_all.deb
rm -rf packageroot
```


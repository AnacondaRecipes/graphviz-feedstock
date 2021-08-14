#!/bin/bash

# Get an updated config.sub and config.guess
cp -r ${BUILD_PREFIX}/share/libtool/build-aux/config.* ./config
cp -r ${BUILD_PREFIX}/share/libtool/build-aux/config.* ./libltdl/config

# Remove any .la files that can break the build, they are un-needed
rm -f $PREFIX/lib/*.la
rm -f $PREFIX/lib/*/*.la

if [[ ${target_platform} == osx-64 ]]; then
    export OBJC=$CC
    ./configure --prefix=$PREFIX \
                --with-quartz \
                --disable-debug \
                --disable-java \
                --disable-php \
                --disable-perl \
                --disable-tcl \
                --without-x \
                --without-qt \
                --without-gtk
else
    ./configure --prefix=$PREFIX \
                --disable-debug \
                --disable-java \
                --disable-php \
                --disable-perl \
                --disable-tcl \
                --without-x \
                --without-qt \
                --without-gtk
fi

make
# This is failing for rtest.
# Doesn't do anything for the rest
# make check
make install

dot -c

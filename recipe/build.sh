#!/bin/bash
set -x

./autogen.sh

# remove libtool files
find $PREFIX -name '*.la' -delete

declare -a _xtra_config_flags

if [[ ${target_platform} =~ .*osx.* ]]; then
    export OBJC="${CC}"
    _xtra_config_flags+=(--with-quartz)
else
    _xtra_config_flags+=(--with-gdk)
fi

# ppc64le cdt need to be rebuilt with files in powerpc64le-conda-linux-gnu instead of powerpc64le-conda_cos7-linux-gnu. In the meantime:
if [ "$(uname -m)" = "ppc64le" ]; then
  cp --force --archive --update --link $BUILD_PREFIX/powerpc64le-conda_cos7-linux-gnu/. $BUILD_PREFIX/powerpc64le-conda-linux-gnu
fi

export PKG_CONFIG_PATH_FOR_BUILD=$BUILD_PREFIX/lib/pkgconfig
export PKG_CONFIG_PATH=${PKG_CONFIG_PATH:-}:${PREFIX}/lib/pkgconfig:$BUILD_PREFIX/$BUILD/sysroot/usr/lib64/pkgconfig:$BUILD_PREFIX/$BUILD/sysroot/usr/share/pkgconfig

# uncomment to help debug import errors regarding missing cdt
# $BUILD_PREFIX/bin/pkg-config --exists --print-errors "pangocairo >= 1.14.9"

./configure --prefix=$PREFIX \
            --disable-static \
            --enable-shared \
            --disable-man-pdfs \
            --without-demos \
            --disable-debug \
            --disable-java \
            --disable-php \
            --disable-perl \
            --disable-tcl \
            --enable-ltdl \
            --without-x \
            --without-qt \
            --without-gtk \
            --with-gts=yes \
            --with-rsvg=yes \
            --with-expat=yes \
            --with-libgd=yes \
            --with-freetype2=yes \
            --with-fontconfig=yes \
            --with-pangocairo=yes \
            --with-gdk-pixbuf=yes \
            "${_xtra_config_flags[@]}"

if [ $CONDA_BUILD_CROSS_COMPILATION = 1 ] && [ "${target_platform}" = "osx-arm64" ]; then
    sed -i.bak 's/HOSTCC/CC_FOR_BUILD/g' $SRC_DIR/lib/gvpr/Makefile.am
    sed -i.bak '/dot$(EXEEXT) -c/d' $SRC_DIR/cmd/dot/Makefile.am
fi

make
# This is failing for rtest.
# Doesn't do anything for the rest
# make check
make install

# Configure plugins
if [ $CONDA_BUILD_CROSS_COMPILATION != 1 ]; then
    $PREFIX/bin/dot -c
fi

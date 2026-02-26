#!/bin/bash
set -x

# https://github.com/conda-forge/xorg-libxfixes-feedstock/issues/13
export PKG_CONFIG_PATH=$PREFIX/share/pkgconfig:$PKG_CONFIG_PATH

./autogen.sh

# remove libtool files
find "$PREFIX" -name '*.la' -delete

# https://github.com/conda-forge/conda-forge.github.io/issues/1880
sed -i.bak '/Requires.private:/d' $PREFIX/lib/pkgconfig/librsvg*.pc

declare -a _xtra_config_flags

if [[ "${target_platform}" =~ .*osx.* ]]; then
    export OBJC="${CC}"
    # xcodebuild uses ld instead of clang and fails
    export LD="${CC_FOR_BUILD}"
    _xtra_config_flags+=(--with-quartz)
fi

./configure --prefix="$PREFIX" \
            --disable-debug \
            --enable-ltdl \
            --without-x \
            --without-qt \
            --without-gtk \
            --enable-ruby=no \
            --enable-swig=no \
            --enable-java=no \
            --enable-php=no \
            --enable-perl=no \
            --enable-tcl=no \
            --enable-python3=no \
            --enable-lua=no \
            --enable-go=no \
            --enable-guile=no \
            --enable-r=no \
            --with-demos=no \
            --with-ann=no \
            --with-gts=yes \
            --with-gdk=yes \
            --with-rsvg=yes \
            --with-expat=yes \
            --with-libgd=yes \
            --with-freetype2=yes \
            --with-pangocairo=yes \
            --with-gdk-pixbuf=yes \
            "${_xtra_config_flags[@]}"

make -j"${CPU_COUNT}"
make install

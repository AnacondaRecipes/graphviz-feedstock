#!/bin/bash
set -x

# https://github.com/conda-forge/xorg-libxfixes-feedstock/issues/13
export PKG_CONFIG_PATH=$PREFIX/share/pkgconfig:$PKG_CONFIG_PATH
export PKG_CONFIG_LIBDIR="$PREFIX/lib/pkgconfig:$PREFIX/share/pkgconfig"

./autogen.sh

# remove libtool files
find "$PREFIX" -name '*.la' -delete

# https://github.com/conda-forge/conda-forge.github.io/issues/1880
sed -i.bak '/Requires.private:/d' $PREFIX/lib/pkgconfig/librsvg*.pc

declare -a _xtra_config_flags

if [[ "${target_platform}" == osx-* ]]; then
    export OBJC="${CC}"
    # xcodebuild uses ld instead of clang and fails
    export LD="${CC_FOR_BUILD}"
    _xtra_config_flags+=(--with-quartz)
    _xtra_config_flags+=(--without-gtk)
    _xtra_config_flags+=(--without-gdk)
    _xtra_config_flags+=(--without-gdk-pixbuf)
fi

if [[ "${target_platform}" == linux-* ]]; then
    _xtra_config_flags+=(--with-gtk=yes)
    _xtra_config_flags+=(--with-gdk=yes)
    _xtra_config_flags+=(--with-gdk-pixbuf=yes)
fi

# -----------------------------------------------------------------------------
# Suppress excessive warnings from legacy Graphviz C code.
# Newer clang (macOS) and gcc emit many -Wsign-conversion, -Wfloat-equal, etc.
# We explicitly disable the noisy warning classes.
# -----------------------------------------------------------------------------
export CFLAGS="${CFLAGS} \
  -Wno-sign-conversion \
  -Wno-float-equal \
  -Wno-switch-default \
  -Wno-unused-but-set-variable \
  -Wno-cast-qual \
  -Wno-bad-function-cast \
  -Wno-implicit-int-float-conversion \
  -Wno-implicit-int-conversion \
  -Wno-shorten-64-to-32 \
  -Wno-float-conversion \
  -Wno-implicit-float-conversion \
  -Wno-unused-parameter"
# -----------------------------------------------------------------------------
# Fix permission issues for Python code generators used during build.
# Graphviz Makefiles try to execute these scripts directly.
# In conda-build environments they may lack execute bit (0644),
# which results in "Permission denied" (Error 126).
# We explicitly mark them executable.
# -----------------------------------------------------------------------------
chmod +x "$SRC_DIR/lib/common/make_colortbl.py" \
          "$SRC_DIR/lib/common/entities.py" || true

./configure --prefix="$PREFIX" \
            --disable-debug \
            --enable-ltdl \
            --without-x \
            --without-qt \
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
            --with-rsvg=yes \
            --with-expat=yes \
            --with-libgd=yes \
            --with-freetype2=yes \
            --with-pangocairo=yes \
            "${_xtra_config_flags[@]}"

make -j"${CPU_COUNT}"
make install

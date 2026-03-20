#!/bin/bash
set -ex

# ----------------------------
# All expected executables exist (explicit list)
# ----------------------------
test -x "$PREFIX/bin/acyclic"
test -x "$PREFIX/bin/bcomps"
test -x "$PREFIX/bin/ccomps"
test -x "$PREFIX/bin/cluster"
test -x "$PREFIX/bin/diffimg"
test -x "$PREFIX/bin/dijkstra"
test -x "$PREFIX/bin/dot"
test -x "$PREFIX/bin/dot_builtins"
test -x "$PREFIX/bin/dot_sandbox"
test -x "$PREFIX/bin/edgepaint"
test -x "$PREFIX/bin/gc"
test -x "$PREFIX/bin/gml2gv"
test -x "$PREFIX/bin/graphml2gv"
test -x "$PREFIX/bin/gv2gml"
test -x "$PREFIX/bin/gvcolor"
test -x "$PREFIX/bin/gvgen"
test -x "$PREFIX/bin/gvmap"
test -x "$PREFIX/bin/gvmap.sh"
test -x "$PREFIX/bin/gvpack"
test -x "$PREFIX/bin/gvpr"
test -x "$PREFIX/bin/gxl2gv"
test -x "$PREFIX/bin/mm2gv"
test -x "$PREFIX/bin/nop"
test -x "$PREFIX/bin/prune"
test -x "$PREFIX/bin/sccmap"
test -x "$PREFIX/bin/tred"
test -x "$PREFIX/bin/unflatten"

# Symlinks that should resolve to existing target (don’t require -x on link itself)
test -e "$PREFIX/bin/circo"
test -e "$PREFIX/bin/dot2gxl"
test -e "$PREFIX/bin/fdp"
test -e "$PREFIX/bin/gv2gxl"
test -e "$PREFIX/bin/gxl2dot"
test -e "$PREFIX/bin/neato"
test -e "$PREFIX/bin/osage"
test -e "$PREFIX/bin/patchwork"
test -e "$PREFIX/bin/sfdp"
test -e "$PREFIX/bin/twopi"

# Optional sanity: make sure symlink targets actually run
"$PREFIX/bin/circo" -V
"$PREFIX/bin/fdp" -V
"$PREFIX/bin/neato" -V
"$PREFIX/bin/osage" -V
"$PREFIX/bin/patchwork" -V
"$PREFIX/bin/sfdp" -V
"$PREFIX/bin/twopi" -V

# ----------------------------
# Core headers exist
# ----------------------------
test -d "$PREFIX/include/graphviz"
test -f "$PREFIX/include/graphviz/arith.h"
test -f "$PREFIX/include/graphviz/cdt.h"
test -f "$PREFIX/include/graphviz/cgraph.h"
test -f "$PREFIX/include/graphviz/color.h"
test -f "$PREFIX/include/graphviz/geom.h"
test -f "$PREFIX/include/graphviz/graphviz_version.h"
test -f "$PREFIX/include/graphviz/gvc.h"
test -f "$PREFIX/include/graphviz/gvcext.h"
test -f "$PREFIX/include/graphviz/gvcjob.h"
test -f "$PREFIX/include/graphviz/gvcommon.h"
test -f "$PREFIX/include/graphviz/gvconfig.h"
test -f "$PREFIX/include/graphviz/gvplugin.h"
test -f "$PREFIX/include/graphviz/gvplugin_device.h"
test -f "$PREFIX/include/graphviz/gvplugin_layout.h"
test -f "$PREFIX/include/graphviz/gvplugin_loadimage.h"
test -f "$PREFIX/include/graphviz/gvplugin_render.h"
test -f "$PREFIX/include/graphviz/gvplugin_textlayout.h"
test -f "$PREFIX/include/graphviz/gvpr.h"
test -f "$PREFIX/include/graphviz/pack.h"
test -f "$PREFIX/include/graphviz/pathgeom.h"
test -f "$PREFIX/include/graphviz/pathplan.h"
test -f "$PREFIX/include/graphviz/textspan.h"
test -f "$PREFIX/include/graphviz/types.h"
test -f "$PREFIX/include/graphviz/usershape.h"
test -f "$PREFIX/include/graphviz/xdot.h"

# ----------------------------
# Core shared libraries
# ----------------------------
test -d "$PREFIX/lib"
ls -1 "$PREFIX/lib/libgvc."*        >/dev/null
ls -1 "$PREFIX/lib/libcgraph."*     >/dev/null
ls -1 "$PREFIX/lib/libcdt."*        >/dev/null
ls -1 "$PREFIX/lib/libpathplan."*   >/dev/null
ls -1 "$PREFIX/lib/libgvpr."*       >/dev/null
ls -1 "$PREFIX/lib/libxdot."*       >/dev/null

# ----------------------------
# Plugin shared libraries
# ----------------------------
test -d "$PREFIX/lib/graphviz"
ls -1 "$PREFIX/lib/graphviz/libgvplugin_core."*          >/dev/null
ls -1 "$PREFIX/lib/graphviz/libgvplugin_dot_layout."*    >/dev/null
ls -1 "$PREFIX/lib/graphviz/libgvplugin_neato_layout."*  >/dev/null
ls -1 "$PREFIX/lib/graphviz/libgvplugin_gd."*            >/dev/null
ls -1 "$PREFIX/lib/graphviz/libgvplugin_pango."*         >/dev/null
ls -1 "$PREFIX/lib/graphviz/libgvplugin_webp."*          >/dev/null
ls -1 "$PREFIX/lib/graphviz/libgvplugin_rsvg."*          >/dev/null
ls -1 "$PREFIX/lib/graphviz/libgvplugin_vt."*            >/dev/null

if [[ "${target_platform}" =~ linux ]]; then
  ls -1 "$PREFIX/lib/graphviz/libgvplugin_gdk."* >/dev/null
fi

ls -1 "$PREFIX/lib/graphviz/config"* >/dev/null

# ----------------------------
# Pkgconfig core files
# ----------------------------
test -d "$PREFIX/lib/pkgconfig"
test -f "$PREFIX/lib/pkgconfig/libgvc.pc"
test -f "$PREFIX/lib/pkgconfig/libcgraph.pc"
test -f "$PREFIX/lib/pkgconfig/libcdt.pc"
test -f "$PREFIX/lib/pkgconfig/libpathplan.pc"
test -f "$PREFIX/lib/pkgconfig/libgvpr.pc"
test -f "$PREFIX/lib/pkgconfig/libxdot.pc"

# ----------------------------
# Configure plugins + versions
# ----------------------------
dot -c
dot -V
dot -v < /dev/null
fdp -V
sfdp -V
neato -?

dot -T? || true

# Render basics (dot)
dot -Tpng  -o sample.png  sample.dot
dot -Tpdf  -o sample.pdf  sample.dot
dot -Tsvg  -o sample.svg  sample.dot
dot -Tjpeg -o sample.jpeg sample.dot
dot -Tgif  -o sample.gif  sample.dot
dot -Ttiff -o sample.tiff sample.dot
dot -Twebp -o sample.webp sample.dot
dot -Teps  -o sample.eps  sample.dot
dot -Tps   -o sample.ps   sample.dot
dot -Tps2  -o sample.ps2  sample.dot
sfdp -Tpdf -o sfdp.pdf sample.dot

# sanity: check if files created and not empty
for f in sample.*; do test -s "$f"; done
test -s sfdp.pdf

#!/bin/bash
set -ex

dot -c
dot -V
dot -v < /dev/null
fdp -V
sfdp -V
neato -?

dot -T? || true

dot -Tpng -o sample.png sample.dot
dot -Tpdf -o sample.pdf sample.dot
dot -Tsvg -o sample.svg sample.dot
dot -Tjpeg -o sample.jpeg sample.dot
sfdp -Tpdf -o sample.pdf sample.dot

# [linux]
# Format: "tiff" not recognized. Use one of: canon cmap cmapx cmapx_np dot dot_json
# eps fig gd gd2 gif gv imap imap_np ismap jpe jpeg jpg json json0 kitty kittyz pdf
# pic plain plain-ext png pov ps ps2 svg svg_inline svgz tk vrml vt vt-24bit vt-4up
# vt-6up vt-8up wbmp webp xdot xdot1.2 xdot1.4 xdot_json

# dot -Ttiff -o sample.tiff sample.dot

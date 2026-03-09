#!/bin/bash
set -ex

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

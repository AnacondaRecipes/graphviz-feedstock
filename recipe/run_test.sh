#!/bin/bash
set -ex
dot -c
dot -V
echo | dot -v
fdp -V
sfdp -V
neato -?

dot -? || true

dot -Tpng -o sample.png sample.dot
# needs ghostscript or perhaps librsvg
dot -Tpdf -o sample.pdf sample.dot
dot -Tsvg -o sample.svg sample.dot
dot -Ttiff -o sample.tiff sample.dot
dot -Tjpeg -o sample.jpeg sample.dot
sfdp -Tpdf -o sample.pdf sample.dot
echo Finished tests.

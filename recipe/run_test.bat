@echo on
setlocal EnableExtensions EnableDelayedExpansion

REM ----------------------------
REM All expected executables exist
REM ----------------------------
if not exist "%LIBRARY_BIN%\acyclic.exe" exit 1
if not exist "%LIBRARY_BIN%\bcomps.exe" exit 1
if not exist "%LIBRARY_BIN%\ccomps.exe" exit 1
if not exist "%LIBRARY_BIN%\circo.exe" exit 1
if not exist "%LIBRARY_BIN%\cluster.exe" exit 1
if not exist "%LIBRARY_BIN%\diffimg.exe" exit 1
if not exist "%LIBRARY_BIN%\dijkstra.exe" exit 1
if not exist "%LIBRARY_BIN%\dot.exe" exit 1
if not exist "%LIBRARY_BIN%\dot2gxl.exe" exit 1
if not exist "%LIBRARY_BIN%\edgepaint.exe" exit 1
if not exist "%LIBRARY_BIN%\fdp.exe" exit 1
if not exist "%LIBRARY_BIN%\gc.exe" exit 1
if not exist "%LIBRARY_BIN%\gml2gv.exe" exit 1
if not exist "%LIBRARY_BIN%\graphml2gv.exe" exit 1
if not exist "%LIBRARY_BIN%\gv2gml.exe" exit 1
if not exist "%LIBRARY_BIN%\gv2gxl.exe" exit 1
if not exist "%LIBRARY_BIN%\gvcolor.exe" exit 1
if not exist "%LIBRARY_BIN%\gvgen.exe" exit 1
if not exist "%LIBRARY_BIN%\gvmap.exe" exit 1
if not exist "%LIBRARY_BIN%\gvpack.exe" exit 1
if not exist "%LIBRARY_BIN%\gvpr.exe" exit 1
if not exist "%LIBRARY_BIN%\gxl2dot.exe" exit 1
if not exist "%LIBRARY_BIN%\gxl2gv.exe" exit 1
if not exist "%LIBRARY_BIN%\mm2gv.exe" exit 1
if not exist "%LIBRARY_BIN%\neato.exe" exit 1
if not exist "%LIBRARY_BIN%\nop.exe" exit 1
if not exist "%LIBRARY_BIN%\osage.exe" exit 1
if not exist "%LIBRARY_BIN%\patchwork.exe" exit 1
if not exist "%LIBRARY_BIN%\prune.exe" exit 1
if not exist "%LIBRARY_BIN%\sccmap.exe" exit 1
if not exist "%LIBRARY_BIN%\sfdp.exe" exit 1
if not exist "%LIBRARY_BIN%\tred.exe" exit 1
if not exist "%LIBRARY_BIN%\twopi.exe" exit 1
if not exist "%LIBRARY_BIN%\unflatten.exe" exit 1

REM Optional: quick run sanity (aliases)
"%LIBRARY_BIN%\circo.exe" -V || exit 1
"%LIBRARY_BIN%\fdp.exe"   -V || exit 1
"%LIBRARY_BIN%\neato.exe" -V || exit 1
"%LIBRARY_BIN%\osage.exe" -V || exit 1
"%LIBRARY_BIN%\patchwork.exe" -V || exit 1
"%LIBRARY_BIN%\sfdp.exe"  -V || exit 1
"%LIBRARY_BIN%\twopi.exe" -V || exit 1

REM ----------------------------
REM Core headers exist
REM ----------------------------
if not exist "%LIBRARY_INC%\graphviz" exit 1
if not exist "%LIBRARY_INC%\graphviz\arith.h" exit 1
if not exist "%LIBRARY_INC%\graphviz\cdt.h" exit 1
if not exist "%LIBRARY_INC%\graphviz\cgraph.h" exit 1
if not exist "%LIBRARY_INC%\graphviz\color.h" exit 1
if not exist "%LIBRARY_INC%\graphviz\geom.h" exit 1
if not exist "%LIBRARY_INC%\graphviz\graphviz_version.h" exit 1
if not exist "%LIBRARY_INC%\graphviz\gvc.h" exit 1
if not exist "%LIBRARY_INC%\graphviz\gvcext.h" exit 1
if not exist "%LIBRARY_INC%\graphviz\gvcjob.h" exit 1
if not exist "%LIBRARY_INC%\graphviz\gvcommon.h" exit 1
if not exist "%LIBRARY_INC%\graphviz\gvconfig.h" exit 1
if not exist "%LIBRARY_INC%\graphviz\gvplugin.h" exit 1
if not exist "%LIBRARY_INC%\graphviz\gvplugin_device.h" exit 1
if not exist "%LIBRARY_INC%\graphviz\gvplugin_layout.h" exit 1
if not exist "%LIBRARY_INC%\graphviz\gvplugin_loadimage.h" exit 1
if not exist "%LIBRARY_INC%\graphviz\gvplugin_render.h" exit 1
if not exist "%LIBRARY_INC%\graphviz\gvplugin_textlayout.h" exit 1
if not exist "%LIBRARY_INC%\graphviz\gvpr.h" exit 1
if not exist "%LIBRARY_INC%\graphviz\pack.h" exit 1
if not exist "%LIBRARY_INC%\graphviz\pathgeom.h" exit 1
if not exist "%LIBRARY_INC%\graphviz\pathplan.h" exit 1
if not exist "%LIBRARY_INC%\graphviz\textspan.h" exit 1
if not exist "%LIBRARY_INC%\graphviz\types.h" exit 1
if not exist "%LIBRARY_INC%\graphviz\usershape.h" exit 1
if not exist "%LIBRARY_INC%\graphviz\xdot.h" exit 1

REM ----------------------------
REM Core libraries exist (import libs and/or dlls)
REM ----------------------------
if not exist "%LIBRARY_BIN%\cdt.dll" exit 1
if not exist "%LIBRARY_BIN%\cgraph.dll" exit 1
if not exist "%LIBRARY_BIN%\gvc.dll" exit 1
if not exist "%LIBRARY_BIN%\gvpr.dll" exit 1
if not exist "%LIBRARY_BIN%\pathplan.dll" exit 1
if not exist "%LIBRARY_BIN%\xdot.dll" exit 1

REM ----------------------------
REM Plugin libraries exist (dll on Windows)
REM ----------------------------
if not exist "%LIBRARY_BIN%\gvplugin_core.dll" exit 1
if not exist "%LIBRARY_BIN%\gvplugin_dot_layout.dll" exit 1
if not exist "%LIBRARY_BIN%\gvplugin_neato_layout.dll" exit 1
if not exist "%LIBRARY_BIN%\gvplugin_gd.dll" exit 1
if not exist "%LIBRARY_BIN%\gvplugin_pango.dll" exit 1
if not exist "%LIBRARY_BIN%\gvplugin_webp.dll" exit 1
if not exist "%LIBRARY_BIN%\gvplugin_vt.dll" exit 1
if not exist "%LIBRARY_BIN%\gvplugin_kitty.dll" exit 1
if not exist "%LIBRARY_BIN%\gvplugin_gdiplus.dll" exit 1

REM --- Import libs ---
if not exist "%LIBRARY_LIB%\cdt.lib" exit 1
if not exist "%LIBRARY_LIB%\cgraph.lib" exit 1
if not exist "%LIBRARY_LIB%\gvc.lib" exit 1
if not exist "%LIBRARY_LIB%\gvpr.lib" exit 1
if not exist "%LIBRARY_LIB%\pathplan.lib" exit 1
if not exist "%LIBRARY_LIB%\xdot.lib" exit 1

REM --- Plugin import libs ---
if not exist "%LIBRARY_LIB%\gvplugin_core.lib" exit 1
if not exist "%LIBRARY_LIB%\gvplugin_dot_layout.lib" exit 1
if not exist "%LIBRARY_LIB%\gvplugin_neato_layout.lib" exit 1
if not exist "%LIBRARY_LIB%\gvplugin_gd.lib" exit 1
if not exist "%LIBRARY_LIB%\gvplugin_pango.lib" exit 1
if not exist "%LIBRARY_LIB%\gvplugin_webp.lib" exit 1
if not exist "%LIBRARY_LIB%\gvplugin_vt.lib" exit 1
if not exist "%LIBRARY_LIB%\gvplugin_kitty.lib" exit 1
if not exist "%LIBRARY_LIB%\gvplugin_gdiplus.lib" exit 1

if exist "%LIBRARY_LIB%\pkgconfig" (
  if not exist "%LIBRARY_LIB%\pkgconfig\libgvc.pc" exit 1
  if not exist "%LIBRARY_LIB%\pkgconfig\libcgraph.pc" exit 1
)

if not exist "%LIBRARY_BIN%\config8" exit 1

REM ----------------------------
REM Basic plugin config + versions
REM ----------------------------
"%LIBRARY_BIN%\dot.exe" -c || exit 1
"%LIBRARY_BIN%\dot.exe" -V || exit 1

REM Show formats (non-fatal)
"%LIBRARY_BIN%\dot.exe" -T? || echo dot -T? failed (non-fatal)

@REM REM ----------------------------
@REM REM Render outputs
@REM REM ----------------------------
@REM @REM "%LIBRARY_BIN%\dot.exe" -Tpng  -o sample.png  sample.dot || exit 1
@REM "%LIBRARY_BIN%\dot.exe" -Tpdf  -o sample.pdf  sample.dot || exit 1
@REM "%LIBRARY_BIN%\dot.exe" -Tsvg  -o sample.svg  sample.dot || exit 1
@REM "%LIBRARY_BIN%\dot.exe" -Tjpeg -o sample.jpeg sample.dot || exit 1
@REM "%LIBRARY_BIN%\dot.exe" -Tgif  -o sample.gif  sample.dot || exit 1
@REM "%LIBRARY_BIN%\dot.exe" -Ttiff -o sample.tiff sample.dot || exit 1
@REM "%LIBRARY_BIN%\dot.exe" -Twebp -o sample.webp sample.dot || exit 1
@REM "%LIBRARY_BIN%\dot.exe" -Teps  -o sample.eps  sample.dot || exit 1
@REM "%LIBRARY_BIN%\dot.exe" -Tps   -o sample.ps   sample.dot || exit 1
@REM "%LIBRARY_BIN%\dot.exe" -Tps2  -o sample.ps2  sample.dot || exit 1

@REM "%LIBRARY_BIN%\sfdp.exe" -Tpdf -o sfdp.pdf sample.dot || exit 1

@REM REM ----------------------------
@REM REM Sanity: outputs are non-empty
@REM REM ----------------------------
@REM for %%F in (sample.png sample.pdf sample.svg sample.jpeg sample.gif sample.tiff sample.webp sample.eps sample.ps sample.ps2 sfdp.pdf) do (
@REM   if not exist "%%F" exit 1
@REM   for %%S in ("%%F") do if %%~zS LSS 1 exit 1
@REM )



REM --------------------------------------------------
REM Diagnostics helper: show what exactly is missing
REM --------------------------------------------------
set "PATH=%PREFIX%\Library\bin;%PATH%"
set "GVBINDIR=%PREFIX%\Library\bin"
set "GVPLUGIN_PATH=%PREFIX%\Library\bin"

echo ===== Graphviz binaries =====
where dot
where neato

echo ===== Key Graphviz DLLs present? =====
dir "%PREFIX%\Library\bin\gvc.dll"
dir "%PREFIX%\Library\bin\gvplugin_gd.dll"
dir "%PREFIX%\Library\bin\cairo-2.dll" 2>nul
dir "%PREFIX%\Library\bin\libpng16.dll" 2>nul
dir "%PREFIX%\Library\bin\zlib.dll" 2>nul

echo ===== Plugin config files =====
dir "%PREFIX%\Library\bin\config*" 2>nul

echo ===== dot -c verbose =====
"%PREFIX%\Library\bin\dot.exe" -c -v <NUL > dot_config.log 2>&1
type dot_config.log


set "PATH=%PREFIX%\Library\bin;%PATH%"
set "GVBINDIR=%PREFIX%\Library\bin"
set "GVPLUGIN_PATH=%PREFIX%\Library\bin"


dot -Tcanon sample.dot -v8

"%LIBRARY_BIN%\dot.exe" -v8 -Tpng  -o sample.png  sample.dot
"%LIBRARY_BIN%\dot.exe" -v8 -Tpdf  -o sample.pdf  sample.dot
"%LIBRARY_BIN%\dot.exe" -v8 -Tsvg  -o sample.svg  sample.dot
"%LIBRARY_BIN%\dot.exe" -v8 -Tjpeg -o sample.jpeg sample.dot
"%LIBRARY_BIN%\dot.exe" -v8 -Tgif  -o sample.gif  sample.dot
"%LIBRARY_BIN%\dot.exe" -v8 -Ttiff -o sample.tiff sample.dot
"%LIBRARY_BIN%\dot.exe" -v8 -Twebp -o sample.webp sample.dot
"%LIBRARY_BIN%\dot.exe" -v8 -Teps  -o sample.eps  sample.dot
"%LIBRARY_BIN%\dot.exe" -v8 -Tps   -o sample.ps   sample.dot
"%LIBRARY_BIN%\dot.exe" -v8 -Tps2  -o sample.ps2  sample.dot

exit 0
setlocal enabledelayedexpansion

dot -c
if %ERRORLEVEL% equ 0 (echo "`dot -c` complete") ELSE (echo "[FATAL] `dot -c` failed with exit code %ERRORLEVEL%" & exit /b %ERRORLEVEL%)

dot -V
if %ERRORLEVEL% equ 0 (echo "`dot -V` complete") ELSE (echo "[FATAL] `dot -V` failed with exit code %ERRORLEVEL%" & exit /b %ERRORLEVEL%)

dot -v < NUL
if %ERRORLEVEL% equ 0 (echo "`dot -v` complete") ELSE (echo "[FATAL] `dot -v` failed with exit code %ERRORLEVEL%" & exit /b %ERRORLEVEL%)

fdp -V
if %ERRORLEVEL% equ 0 (echo "`fdp -V` complete") ELSE (echo "[FATAL] `fdp -V` failed with exit code %ERRORLEVEL%" & exit /b %ERRORLEVEL%)

sfdp -V
if %ERRORLEVEL% equ 0 (echo "`sfdp -V` complete") ELSE (echo "[FATAL] `sfdp -V` failed with exit code %ERRORLEVEL%" & exit /b %ERRORLEVEL%)

neato -?
if %ERRORLEVEL% equ 0 (echo "`neato -?` complete") ELSE (echo "[FATAL] `neato -?` failed with exit code %ERRORLEVEL%" & exit /b %ERRORLEVEL%)

for %%t in (png, pdf, svg, tiff, jpeg) do (
    dot -T%%t -o sample.%%t sample.dot
    if !ERRORLEVEL! equ 0 (echo "dot %%t test complete") ELSE (echo "[FATAL] `dot -T%%t -o sample.%%t sample.dot` failed with exit code !ERRORLEVEL!" & exit /b !ERRORLEVEL!)
)

sfdp -Tpdf -o sample.pdf sample.dot
if %ERRORLEVEL% equ 0 (echo "sfdp pdf test complete") ELSE (echo "[FATAL] `sfdp -Tpdf -o sample.pdf sample.dot` failed with exit code %ERRORLEVEL%" & exit /b %ERRORLEVEL%)

call dot.bat -V
if %ERRORLEVEL% equ 0 (echo "`dot.bat -V` complete") ELSE (echo "[FATAL] `dot.bat -V` failed with exit code %ERRORLEVEL%" & exit /b %ERRORLEVEL%)

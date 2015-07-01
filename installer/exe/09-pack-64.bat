@echo off
SETLOCAL
call ..\settings.cmd

SET PERLPATH=%CD%\64\perl
SET PATH=C:\Windows\system32

SET PATH=%PERLPATH%\perl\site\bin;%PATH%
SET PATH=%PERLPATH%\perl\bin;%PATH%
SET PATH=%PERLPATH%\c\bin;%PATH%

cd 64

call pp -B -o websprite.exe ^
-I ../../../../lib ^
-I ../../../blib/lib ^
-M GD ^
-M OCBNET::Image::GD ^
-l "%PERLPATH%/c/bin/zlib1__.dll" ^
-l "%PERLPATH%/c/bin/libgd-2__.dll" ^
-l "%PERLPATH%/c/bin/libXpm__.dll" ^
-l "%PERLPATH%/c/bin/libjpeg-8__.dll" ^
-l "%PERLPATH%/c/bin/libpng15-15__.dll" ^
-l "%PERLPATH%/c/bin/libiconv-2__.dll" ^
-l "%PERLPATH%/c/bin/libfreetype-6__.dll" ^
../../../bin/websprite

cd ..

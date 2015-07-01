@echo off
SETLOCAL
call ..\settings.cmd

SET PERLPATH=%CD%\32\perl
SET PATH=C:\Windows\system32

SET PATH=%PERLPATH%\perl\site\bin;%PATH%
SET PATH=%PERLPATH%\perl\bin;%PATH%
SET PATH=%PERLPATH%\c\bin;%PATH%

cd 32

call pp -B -o websprite.exe ^
-I ../../../../lib ^
-I ../../../blib/lib ^
-M GD ^
-M OCBNET::Image::GD ^
-l "%PERLPATH%/c/bin/zlib1_.dll" ^
-l "%PERLPATH%/c/bin/libgd-2_.dll" ^
-l "%PERLPATH%/c/bin/libXpm_.dll" ^
-l "%PERLPATH%/c/bin/libjpeg-8_.dll" ^
-l "%PERLPATH%/c/bin/libpng15-15_.dll" ^
-l "%PERLPATH%/c/bin/libiconv-2_.dll" ^
-l "%PERLPATH%/c/bin/libfreetype-6_.dll" ^
../../../bin/websprite

cd ..

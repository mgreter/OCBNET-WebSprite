@echo off
SETLOCAL
call ..\settings.cmd

if not exist dist mkdir dist

git describe --tags --abbrev=0 > git-tag.txt
SET /p gitversion=<git-tag.txt
del git-tag.txt

call set gitversion=%%RELVERSION:v=%%

cd 64

"%WIX%\bin\light.exe" ^
-nologo -sw1076 ^
-dPlatform="x64" ^
-dGitVersion=%gitversion% ^
-b bin dist\bin.wixobj ^
-b examples dist\examples.wixobj ^
dist\websprite.wixobj ^
-ext WixBalExtension ^
-ext WixUIExtension ^
-ext WixUtilExtension ^
-o ..\dist\OCBNET-WebSprite-%gitversion%-x64.msi

cd ..

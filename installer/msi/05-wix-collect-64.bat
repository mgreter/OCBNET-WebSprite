@echo off
SETLOCAL
call ..\settings.cmd

if not exist 64 mkdir 64

cd 64

"%WIX%\bin\heat.exe" file ".\websprite.exe" -platform x64 -nologo -cg gm -gg -scom -sreg -ke -dr APPLICATIONFOLDER -template fragment -out dist\bin.wxs
"%WIX%\bin\heat.exe" dir ".\examples" -platform x64 -nologo -cg examples -gg -scom -sreg -ke -dr ExamplesFolder -srd -template fragment -out dist\examples.wxs

cd ..
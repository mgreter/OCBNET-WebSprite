@echo off
SETLOCAL
call ..\settings.cmd

if not exist 32 mkdir 32

cd 32

"%WIX%\bin\heat.exe" file ".\websprite.exe" -nologo -cg gm -nologo -gg -scom -sreg -ke -dr APPLICATIONFOLDER -template fragment -out dist\bin.wxs -platform x86
"%WIX%\bin\heat.exe" dir ".\examples" -nologo -cg examples -nologo -gg -scom -sreg -ke -dr ExamplesFolder -srd -template fragment -out dist\examples.wxs -platform x86

cd ..

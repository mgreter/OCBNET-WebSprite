@echo off

if not exist 32 mkdir 32
if not exist 32\examples mkdir 32\examples

cd 32

call copy ..\..\exe\32\websprite.exe websprite.exe

call copy ..\..\..\t\fam.bat examples\fam.bat
call copy ..\..\..\t\hires.bat examples\hires.bat
call xcopy /Y /I /S ..\..\..\t\fam examples\fam
call xcopy /Y /I /S ..\..\..\t\hires examples\hires

cd ..

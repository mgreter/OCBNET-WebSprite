@echo off

if not exist 64 mkdir 64
if not exist 64\examples mkdir 64\examples

cd 64

call copy ..\..\exe\64\websprite.exe websprite.exe

call copy ..\..\..\t\fam.bat examples\fam.bat
call copy ..\..\..\t\hires.bat examples\hires.bat
call xcopy /Y /I /S ..\..\..\t\fam examples\fam
call xcopy /Y /I /S ..\..\..\t\hires examples\hires

cd ..

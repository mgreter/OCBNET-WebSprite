@echo off
SETLOCAL
call ..\settings.cmd

SET OLDPATH=%PATH%
SET PERLPATH=%CD%\64\perl
SET PATH=C:\Windows\system32

SET PATH=%PERLPATH%\perl\site\bin;%PATH%
SET PATH=%PERLPATH%\perl\bin;%PATH%
SET PATH=%PERLPATH%\c\bin;%PATH%

call cpanm Win32::Unicode
call cpanm Win32::IPC
call cpanm PAR::Packer
call cpanm OCBNET::CSS3

SET PATH=%OLDPATH%
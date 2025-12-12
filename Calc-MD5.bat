@echo off
certutil -hashfile "%~1" MD5
pause

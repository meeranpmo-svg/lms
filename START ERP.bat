@echo off
echo.
echo  ==============================================
echo    ANSHA SHINE KIDS SCHOOL — ERP SYSTEM
echo    School Management Portal
echo    Chennai, Tamil Nadu
echo    anshashinekidsschool.com
echo  ==============================================
echo.
echo  Starting ERP server on port 8081...
echo  Opening: http://localhost:8081
echo.
start "" "http://localhost:8081"
"C:\Program Files\Git\usr\bin\perl.exe" "%~dp0server.pl"
pause

%2\ar000stop.exe
del %2\*.* /F /S /Q
xcopy %1\*.* %2 /E /Y /Q
start "AR000" %2\ar000loader.exe

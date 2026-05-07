@echo off
setlocal
:MENU

echo 1. Verificacion de Bucle Local (127.0.0.1)
echo 2. Obtener IP de la placa (ipconfig)
echo 3. Prueba estandar (ping -n 4)
echo 4. Monitoreo continuo (ping -t en la misma ventana)
echo 5. Prueba de carga (10 paquetes de 1000 bytes)
echo 0. Salir
echo.
set /p opcion=Elija una opcion [0-5] ^> 

if /i "%opcion%"=="1" goto LOOPBACK
if /i "%opcion%"=="2" goto IPCONFIG
if /i "%opcion%"=="3" goto PING4
if /i "%opcion%"=="4" goto PINGT
if /i "%opcion%"=="5" goto PINGLOAD
if /i "%opcion%"=="0" goto END

echo Opcion invalida. Presione una tecla para volver al menu.
pause >nul
goto MENU

:LOOPBACK
cls
echo Ejecutando ping a 127.0.0.1...
ping 127.0.0.1 -n 4

:IPCONFIG
cls
echo Mostrando ipconfig...
ipconfig

goto MENU

:PING4
cls
ping www.google.com -n 4
echo Enviando 4 paquetes a www.google.com...

pause
goto MENU

:PINGT
cls

echo.
cmd /c "ping www.google.com -t"
pause
goto MENU

:PINGLOAD
cls
echo Enviando 10 paquetes de 1000 bytes a www.google.com...
ping www.google.com -n 10 -l 1000
pause
goto MENU

:END
echo Saliendo...
endlocal
exit /b

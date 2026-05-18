@echo off
setlocal
:MENU

cls
echo 1. Verificacion de Bucle Local (127.0.0.1)
echo 2. Obtener IP de la placa (ipconfig)
echo 3. Prueba estandar (ping -n 4)
echo 4. Monitoreo continuo (ping -t en la misma ventana)
echo 5. Prueba de carga (10 paquetes de 1000 bytes)
echo 6. Traceroute a www.utn.edu.ar (tracert)
echo 7. nslookup para hosts especificos
echo 8. ipconfig
echo 0. Salir
echo.
set /p opcion=Elija una opcion [0-8] ^> 

if /i "%opcion%"=="1" goto LOOPBACK
if /i "%opcion%"=="2" goto IPCONFIG
if /i "%opcion%"=="3" goto PING4
if /i "%opcion%"=="4" goto PINGT
if /i "%opcion%"=="5" goto PINGLOAD
if /i "%opcion%"=="6" goto TRACERTUTN
if /i "%opcion%"=="7" goto NSLOOKUPS
if /i "%opcion%"=="8" goto IPCONFIG
if /i "%opcion%"=="0" goto END

echo Opcion invalida. Presione una tecla para volver al menu.
pause >nul
goto MENU

:LOOPBACK
cls
echo Ejecutando ping a 127.0.0.1...
ping 127.0.0.1 -n 4
pause
goto MENU

:IPCONFIG
ipconfig
goto MENU

:PING4
cls
echo Enviando 4 paquetes a www.google.com...
ping www.google.com -n 4
pause
goto MENU

:PINGT
cls
echo Iniciando ping continuo a www.google.com (Ctrl+C para detener)...
ping www.google.com -t
pause
goto MENU

:PINGLOAD
cls
echo Enviando 10 paquetes de 1000 bytes a www.google.com...
ping www.google.com -n 10 -l 1000
pause
goto MENU

:TRACERTUTN
cls
echo Ejecutando tracert a www.utn.edu.ar...
tracert www.utn.edu.ar
pause
goto MENU

:NSLOOKUPS
cls
echo Ejecutando nslookup para hosts especificos...
echo.
echo nslookup www.inet.edu.ar
nslookup www.inet.edu.ar
echo Resultado esperado aproximado: 190.210.224.216
echo.
echo nslookup www.google.com
nslookup www.google.com
echo Resultado esperado: una IP como 142.250.78.68 (puede variar)
echo.
echo nslookup brexxon.net.ar
nslookup brexxon.net.ar
echo Resultado esperado aproximado: 190.210.224.216
pause
goto MENU

:IPCONFIG
cls
ipconfig
pause
goto MENU

:END
echo Saliendo...
endlocal
exit /b

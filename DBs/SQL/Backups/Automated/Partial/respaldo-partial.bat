@echo off
setlocal enabledelayedexpansion

:: Configuración
set MYSQL_USER=root
set MYSQL_PASSWORD=########
set MYSQL_HOST=localhost
set MYSQL_PORT=3309
set MYSQL_DATABASE=bd_hospital
set MYSQL_TABLE=tbb_medicamentos
set BACKUP_PATH=C:\Respaldos
set BACKUP_FILE=%BACKUP_PATH%\Backup_%MYSQL_DATABASE%_%MYSQL_TABLE%-%DATE:~6,4%-%DATE:~3,2%-%DATE:~0,2%_%TIME:~0,2%%TIME:~3,2%.sql

:: Encabezado ASCII
echo.
echo  ##################################################
echo  #                                                #
echo  #             RESPALDO AUTOMATIZADO              #
echo  #                                                #
echo  ##################################################
echo.

:: Obtener hora de inicio
for /f "tokens=1-4 delims=:.," %%a in ("%time%") do (
    set START_HOUR=%%a
    set START_MIN=%%b
    set START_SEC=%%c
)
set START_TIME=%START_HOUR%:%START_MIN%:%START_SEC%

echo Iniciando respaldo de la tabla %MYSQL_TABLE% de la base de datos %MYSQL_DATABASE%...
echo Fecha y hora de inicio: %date% %START_TIME%
echo.

:: Crear directorio de respaldo si no existe
if not exist "%BACKUP_PATH%" mkdir "%BACKUP_PATH%"

:: Ejecutar respaldo de la tabla con mysqldump
mysqldump -h%MYSQL_HOST% -P%MYSQL_PORT% -u%MYSQL_USER% -p%MYSQL_PASSWORD% %MYSQL_DATABASE% %MYSQL_TABLE% > "%BACKUP_FILE%"

:: Obtener hora de finalización
for /f "tokens=1-4 delims=:.," %%a in ("%time%") do (
    set END_HOUR=%%a
    set END_MIN=%%b
    set END_SEC=%%c
)
set END_TIME=%END_HOUR%:%END_MIN%:%END_SEC%

:: Calcular tiempo transcurrido
set /a DURATION_HOUR=%END_HOUR%-%START_HOUR%
set /a DURATION_MIN=%END_MIN%-%START_MIN%
set /a DURATION_SEC=%END_SEC%-%START_SEC%

:: Obtener tamaño del archivo
for %%F in ("%BACKUP_FILE%") do set SIZE=%%~zF

echo.
echo ====================================
echo =  RESPALDO COMPLETADO CON ÉXITO  =
echo ====================================
echo Fecha y hora de finalizacion: %date% %END_TIME%
echo Tiempo total de duracion: %DURATION_HOUR%h %DURATION_MIN%m %DURATION_SEC%s
echo Magnitud del archivo de respaldo: %SIZE% bytes
echo Archivo generado en: %BACKUP_FILE%
echo.

endlocal
pause

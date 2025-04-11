@echo off
setlocal enabledelayedexpansion

:: Configuración
set MONGO_USER=root
set MONGO_PASSWORD=password
set MONGO_CLUSTER=cluster0.1sefttm.mongodb.net
set MONGO_DB=bd_hospital
set BACKUP_PATH=C:\RespaldosMongo
set DATESTAMP=%DATE:~6,4%-%DATE:~3,2%-%DATE:~0,2%
set TIMESTAMP=%TIME:~0,2%%TIME:~3,2%
set BACKUP_DIR=%BACKUP_PATH%\Backup-%MONGO_DB%-%DATESTAMP%_%TIMESTAMP%

:: Encabezado
echo.
echo ##################################################
echo #                                                #
echo #          RESPALDO AUTOMATIZADO MONGODB         #
echo #                                                #
echo ##################################################
echo.

:: Obtener hora de inicio
for /f "tokens=1-4 delims=:.," %%a in ("%time%") do (
    set START_HOUR=%%a
    set START_MIN=%%b
    set START_SEC=%%c
)
set START_TIME=%START_HOUR%:%START_MIN%:%START_SEC%

echo Iniciando respaldo de %MONGO_DB%...
echo Fecha y hora de inicio: %date% %START_TIME%
echo.

:: Crear carpeta de respaldo si no existe
if not exist "%BACKUP_PATH%" mkdir "%BACKUP_PATH%"

:: Ejecutar respaldo con mongodump
mongodump --uri="mongodb+srv://%MONGO_USER%:%MONGO_PASSWORD%@%MONGO_CLUSTER%/%MONGO_DB%?retryWrites=true&w=majority" --out="%BACKUP_DIR%"

:: Obtener hora de finalización
for /f "tokens=1-4 delims=:.," %%a in ("%time%") do (
    set END_HOUR=%%a
    set END_MIN=%%b
    set END_SEC=%%c
)
set END_TIME=%END_HOUR%:%END_MIN%:%END_SEC%

:: Calcular duración (simple, sin manejar valores negativos)
set /a DURATION_HOUR=%END_HOUR%-%START_HOUR%
set /a DURATION_MIN=%END_MIN%-%START_MIN%
set /a DURATION_SEC=%END_SEC%-%START_SEC%

:: Obtener tamaño total del respaldo
set SIZE=0
for /R "%BACKUP_DIR%" %%F in (*) do (
    set /a SIZE+=%%~zF
)

echo.
echo ====================================
echo =   RESPALDO DE MONGODB COMPLETO  =
echo ====================================
echo Fecha y hora de finalización: %date% %END_TIME%
echo Tiempo total de duración: %DURATION_HOUR%h %DURATION_MIN%m %DURATION_SEC%s
echo Tamaño total del respaldo: %SIZE% bytes
echo Carpeta generada: %BACKUP_DIR%
echo.

endlocal
pause

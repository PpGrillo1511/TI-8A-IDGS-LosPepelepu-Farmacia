@echo off
setlocal enabledelayedexpansion

:: Configuración
set MONGO_USER=root
set MONGO_PASSWORD=password
set MONGO_CLUSTER=cluster
set MONGO_DB=bd_hospital
set COLLECTION=lote_medicamentos
set BACKUP_PATH=C:\RespaldosMongoJSON
set DATESTAMP=%DATE:~6,4%-%DATE:~3,2%-%DATE:~0,2%
set TIMESTAMP=%TIME:~0,2%%TIME:~3,2%
set BACKUP_FILE=%BACKUP_PATH%\Backup-%MONGO_DB%-%COLLECTION%-%DATESTAMP%_%TIMESTAMP%.json

:: Encabezado
echo.
echo  ########################################################
echo  #                                                      #
echo  #   RESPALDO JSON AUTOMATIZADO DE MONGODB              #
echo  #                                                      #
echo  ########################################################
echo.

:: Crear directorio si no existe
if not exist "%BACKUP_PATH%" mkdir "%BACKUP_PATH%"

:: Ejecutar mongoexport
mongoexport --uri="mongodb+srv://%MONGO_USER%:%MONGO_PASSWORD%@%MONGO_CLUSTER%/%MONGO_DB%" --collection=%COLLECTION% --out="%BACKUP_FILE%" --jsonArray

:: Verificar resultado
if exist "%BACKUP_FILE%" (
    echo ✅ Respaldo completado con éxito.
    echo Archivo generado: %BACKUP_FILE%
) else (
    echo ❌ Hubo un error al generar el respaldo.
)

echo.
endlocal
pause

@echo_bot off
for /f "tokens=1-4 delims=/ " %%i in ("%date%") do (
     set dow=%%i
     set month=%%j
     set day=%%k
     set year=%%l
)
set target_folder=%month%_%day%_%year%
if not exist "%target_folder%" mkdir %target_folder%
setlocal EnableDelayedExpansion
SET postman_api_key="PMAK-5f32528097ae8a003770dcd3-66be05f2fe5a377e8b9cedf07b7e434e2e"
set collection[1]=7542005-d4f65724-f381-4553-bfff-58b5f32db7fe
set env[1]=9018931-4a2391ae-737b-4def-9d0d-7bc9be39d25e
set name[1]=Insurance
set collection[2]=7542005-d4f65724-f381-4553-bfff-58b5f32db7fe
set env[2]=9018931-4a2391ae-737b-4def-9d0d-7bc9be39d25e
set name[2]=dlt
set collection[3]=7542005-d4f65724-f381-4553-bfff-58b5f32db7fe
set env[3]=9018931-4a2391ae-737b-4def-9d0d-7bc9be39d25e
set name[3]=inblock
for /L %%x in (1,1,3) do (
set colle=!collection[%%x]!
set envi=!env[%%x]!
set col_name=!name[%%x]!
set collection_folder=%target_folder%\!col_name!
cd %target_folder%
if not exist "!col_name!" mkdir !col_name!
echo colle !colle!
echo envi !envi!
echo name !col_name!
echo collection_folder !collection_folder!
curl -X GET https://api.getpostman.com/collections/%postman_collection_id% -H "X-Api-Key: %postman_api_key%" -H "Cache-Control: no-cache" -o !col_name!\collection.json
curl -X GET https://api.getpostman.com/environments/%postman_collection_env% -H "X-Api-Key: %postman_api_key%" -H "Cache-Control: no-cache" -o !col_name!\environment.json
)
PAUSE

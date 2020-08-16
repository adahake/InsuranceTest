@echo off
for /f "tokens=1-4 delims=/ " %%i in ("%date%") do (
     set dow=%%i
     set month=%%j
     set day=%%k
     set year=%%l
)
set target_folder=%month%_%day%_%year%
SET postman_api_key="PMAK-5f32528097ae8a003770dcd3-66be05f2fe5a377e8b9cedf07b7e434e2e"
SET postman_collection_id="10899512-4e24b7bb-9223-4a77-87a6-a95fd76ade4f"
SET postman_collection_env="10899512-110ebedf-de77-48c7-b2c7-a2bb85a70cd4"
if not exist "%target_folder%" mkdir %target_folder%

curl -X GET https://api.getpostman.com/collections/%postman_collection_id% -H "X-Api-Key: %postman_api_key%" -H "Cache-Control: no-cache" -o %target_folder%\collection.json
curl -X GET https://api.getpostman.com/environments/%postman_collection_env% -H "X-Api-Key: %postman_api_key%" -H "Cache-Control: no-cache" -o %target_folder%\environment.json


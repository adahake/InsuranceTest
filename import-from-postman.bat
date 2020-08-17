@echo off
for /f "tokens=1-4 delims=/ " %%i in ("%date%") do (
     set dow=%%i
     set month=%%j
     set day=%%k
     set year=%%l
)
set target_folder=%month%_%day%_%year%
SET postman_api_key="PMAK-5f32528097ae8a003770dcd3-66be05f2fe5a377e8b9cedf07b7e434e2e"
SET postman_collection_id="7542005-d4f65724-f381-4553-bfff-58b5f32db7fe"
SET postman_collection_env="9018931-4a2391ae-737b-4def-9d0d-7bc9be39d25e"
if not exist "%target_folder%" mkdir %target_folder%

curl -X GET https://api.getpostman.com/collections/%postman_collection_id% -H "X-Api-Key: %postman_api_key%" -H "Cache-Control: no-cache" -o %target_folder%\Insurance.postman_collection.json
curl -X GET https://api.getpostman.com/environments/%postman_collection_env% -H "X-Api-Key: %postman_api_key%" -H "Cache-Control: no-cache" -o %target_folder%\Insurance-Test2.postman_environment.json


@echo off
for /f "tokens=1-4 delims=/ " %%i in ("%date%") do (
     set dow=%%i
     set month=%%j
     set day=%%k
     set year=%%l
)
set target_folder=%month%_%day%_%year%
SET postman_api_key="PMAK-5f32528097ae8a003770dcd3-66be05f2fe5a377e8b9cedf07b7e434e2e"
SET postman_collection_id="da22a8c7-a278-46a2-9e6c-f674145c0808"
SET postman_collection_env="9018931-da22a8c7-a278-46a2-9e6c-f674145c0808"
if not exist "%target_folder%" mkdir %target_folder%

curl -X GET https://api.getpostman.com/collections/%postman_collection_id% -H "X-Api-Key: %postman_api_key%" -H "Cache-Control: no-cache" -o %target_folder%\Insurance.postman_collection.json
curl -X GET https://api.getpostman.com/environments/%postman_collection_env% -H "X-Api-Key: %postman_api_key%" -H "Cache-Control: no-cache" -o %target_folder%\Insurance-Test2.postman_environment.json


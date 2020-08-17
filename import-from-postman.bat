@echo off
for /f "tokens=1-4 delims=/ " %%i in ("%date%") do (
     set dow=%%i
     set month=%%j
     set day=%%k
     set year=%%l
)
set target_folder=%month%_%day%_%year%A%
SET postman_api_key="PMAK-5f3a7160b475490034f385ea-4e77de31f63185578a607d0cc674626607"
SET postman_collection_id="97ee5752-904e-4149-8d24-7e987be15031"
SET postman_collection_env="9018931-97ee5752-904e-4149-8d24-7e987be15031"
if not exist "%target_folder%" mkdir %target_folder%

curl -X GET https://api.getpostman.com/collections/%postman_collection_id% -H "X-Api-Key: %postman_api_key%" -H "Cache-Control: no-cache" -o %target_folder%\Insurance.postman_collection.json
curl -X GET https://api.getpostman.com/environments/%postman_collection_env% -H "X-Api-Key: %postman_api_key%" -H "Cache-Control: no-cache" -o %target_folder%\Insurance-Test2.postman_environment.json


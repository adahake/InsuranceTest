@echo off
echo Run the CMD program
pause
cls 
git init
git pull https://github.com/adahake/InsuranceTest.git
git status
git add .
git commit -m "changes made"
git status
git remote add origin https://github.com/adahake/InsuranceTest.git
git remote -v 
git push -u origin master 
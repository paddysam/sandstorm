@echo off
chcp 65001 >nul
cd /d "%~dp0"

echo [1/5] 初始化 Git 仓库...
git init
if errorlevel 1 goto err

echo [2/5] 添加远程仓库...
git remote add origin https://github.com/paddysam/sandstorm.git
if errorlevel 1 (
    git remote set-url origin https://github.com/paddysam/sandstorm.git
)

echo [3/5] 添加所有文件并提交...
git add .
git commit -m "Initial commit: 末日沙尘暴 第一卷"
if errorlevel 1 goto err

echo [4/5] 设置主分支为 main...
git branch -M main

echo [5/5] 推送到 GitHub...
git push -u origin main
if errorlevel 1 goto err

echo.
echo 已完成：代码已推送到 https://github.com/paddysam/sandstorm
goto end

:err
echo.
echo 出错。若仓库已有内容，可先执行: git pull origin main --allow-unrelated-histories
echo 再执行: git push -u origin main
echo 若需登录，请确保已配置 GitHub 凭据或 Personal Access Token。

:end
pause

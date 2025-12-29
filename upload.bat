@echo off
chcp 65001 >nul

echo 添加文件到Git...
git add . >nul
if errorlevel 1 (
    echo [错误] Git添加文件失败
    pause
    exit /b 1
)

echo 提交更改...
git commit -m "!commit_msg!" >nul
if errorlevel 1 (
    echo [错误] Git提交失败
    pause
    exit /b 1
)

echo 推送到GitHub...
git push origin main >nul 2>nul
if errorlevel 1 (
    git push origin master >nul 2>nul
    if errorlevel 1 (
        echo [错误] 推送失败，请检查远程分支
        pause
        exit /b 1
    )
)

echo completed!

pause
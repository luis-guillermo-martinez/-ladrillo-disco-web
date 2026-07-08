@echo off
echo ============================================
echo   REORGANIZAR PROYECTO - Ladrillo Disco
echo ============================================
echo.
echo Este script mueve index.html, team.html y contacto.html
echo a la raiz del proyecto, y corrige las rutas hacia
echo framerusercontent.com para que sigan funcionando.
echo.
pause

move "www.elcaserioclub.com\index.html" "index.html"
move "www.elcaserioclub.com\team.html" "team.html"
move "www.elcaserioclub.com\contacto.html" "contacto.html"
rd /s /q "www.elcaserioclub.com"

echo Corrigiendo rutas relativas...
powershell -NoProfile -Command "(Get-Content 'index.html' -Raw) -replace '\.\./framerusercontent\.com', 'framerusercontent.com' | Set-Content 'index.html' -NoNewline -Encoding UTF8"
powershell -NoProfile -Command "(Get-Content 'team.html' -Raw) -replace '\.\./framerusercontent\.com', 'framerusercontent.com' | Set-Content 'team.html' -NoNewline -Encoding UTF8"
powershell -NoProfile -Command "(Get-Content 'contacto.html' -Raw) -replace '\.\./framerusercontent\.com', 'framerusercontent.com' | Set-Content 'contacto.html' -NoNewline -Encoding UTF8"

echo.
echo ============================================
echo   Listo. Estructura final:
echo ============================================
dir /b
pause

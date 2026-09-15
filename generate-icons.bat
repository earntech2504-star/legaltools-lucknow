@echo off
echo LegalTools Lucknow - Icon Generator
echo =====================================
mkdir icons 2>nul
cd icons

where magick >nul 2>nul
if %errorlevel%==0 (
    magick -background none -resize 192x192 icon.svg icon-192.png
    magick -background none -resize 512x512 icon.svg icon-512.png
    magick -background none -resize 192x192 icon.svg icon-192-maskable.png
    magick -background none -resize 512x512 icon.svg icon-512-maskable.png
    echo Done!
) else (
    echo Error: ImageMagick install karo - https://imagemagick.org
)
pause
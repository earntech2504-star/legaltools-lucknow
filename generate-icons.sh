#!/bin/bash
# LegalTools Lucknow - Icon Generator
# Requirements: ImageMagick (convert) OR librsvg (rsvg-convert)

set -e
cd "$(dirname "$0")"

echo "📦 LegalTools Lucknow - Icon Generator"
echo "========================================"

# Detect tool
if command -v rsvg-convert >/dev/null 2>&1; then
    TOOL="rsvg"
elif command -v convert >/dev/null 2>&1; then
    TOOL="imagemagick"
elif command -v magick >/dev/null 2>&1; then
    TOOL="magick"
else
    echo "❌ Error: rsvg-convert ya ImageMagick install karo"
    echo ""
    echo "Ubuntu/Debian: sudo apt install librsvg2-bin"
    echo "macOS:         brew install librsvg"
    echo "Windows:       https://imagemagick.org/script/download.php"
    exit 1
fi

mkdir -p icons
cd icons

SVG="icon.svg"

echo "🎨 Generating icons using $TOOL..."

# Any purpose icons
case $TOOL in
  rsvg)
    rsvg-convert -w 192 -h 192 "$SVG" -o icon-192.png
    rsvg-convert -w 512 -h 512 "$SVG" -o icon-512.png
    rsvg-convert -w 192 -h 192 "$SVG" -o icon-192-maskable.png
    rsvg-convert -w 512 -h 512 "$SVG" -o icon-512-maskable.png
    ;;
  imagemagick)
    convert -background none -resize 192x192 "$SVG" icon-192.png
    convert -background none -resize 512x512 "$SVG" icon-512.png
    convert -background none -resize 192x192 "$SVG" icon-192-maskable.png
    convert -background none -resize 512x512 "$SVG" icon-512-maskable.png
    ;;
  magick)
    magick -background none -resize 192x192 "$SVG" icon-192.png
    magick -background none -resize 512x512 "$SVG" icon-512.png
    magick -background none -resize 192x192 "$SVG" icon-192-maskable.png
    magick -background none -resize 512x512 "$SVG" icon-512-maskable.png
    ;;
esac

echo "✅ Icons generated:"
ls -la *.png
echo ""
echo "🎉 Done! Ab icons/ folder ready hai."
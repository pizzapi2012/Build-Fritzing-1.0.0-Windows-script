@echo off
rem 10_Download_Fritzing_Parts_Library.bat
rem http://www.neko.ne.jp/~freewing/software/build_fritzing_100_windows/
rem Copyright (c) 2023-2025 FREE WING,Y.Sakamoto
echo %0
timeout /T 10 /NOBREAK
cd /d \00_fritzing

call 00_env

Path=%cd%\PortableGit\bin;%Path%

mkdir release64
cd release64

echo https://github.com/fritzing/fritzing-parts -b %Fritzing_parts%
git clone https://github.com/fritzing/fritzing-parts -b %Fritzing_parts%

cd ..

exit


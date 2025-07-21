@echo off
rem 04_Install_Visual_Studio_Build_Tools_2019.bat
rem http:^//www.neko.ne.jp/~freewing/software/build_fritzing_100_windows/
rem Copyright (c) 2023 FREE WING,Y.Sakamoto
echo %0
timeout /T 10 /NOBREAK
cd /d \00_fritzing

if exist "C:^\Program Files (x86)\Microsoft Visual Studio\2019\BuildTools" exit


@echo off
echo Check Admin Plivilege
whoami /groups | find "S-1-16-12288" > nul
if %ErrorLevel% == 0 goto is_admin

echo .
echo ===
echo User Account Control
echo ===
echo Select Yes
rem Beep
rundll32 user32.dll,MessageBeep
pause

:is_admin

set VSDIR=%cd%
vs_BuildTools_2019.exe --config %VSDIR%\VSBT_VS2019.vsconfig ^
  --norestart --passive --wait ^
  --add ^
    Microsoft.VisualStudio.Component.Roslyn.Compiler;^
    Microsoft.Component.MSBuild;^Microsoft.VisualStudio.Component.CoreBuildTools;^
    Microsoft.VisualStudio.Workload.MSBuildTools;^
    Microsoft.VisualStudio.Component.Windows10SDK;^
    Microsoft.VisualStudio.Component.VC.CoreBuildTools;^
    Microsoft.VisualStudio.Component.VC.Tools.x86.x64;^
    Microsoft.VisualStudio.Component.VC.Redist.14.Latest;^
    Microsoft.VisualStudio.Component.Windows10SDK.19041;^
    Microsoft.VisualStudio.Component.VC.CMake.Project;^
    Microsoft.VisualStudio.Component.TestTools.BuildTools;^
    Microsoft.VisualStudio.Component.VC.ASAN;^
    Microsoft.VisualStudio.Component.TextTemplating;^
    Microsoft.VisualStudio.Component.VC.CoreIde;^
    Microsoft.VisualStudio.ComponentGroup.NativeDesktop.Core;^
    Microsoft.VisualStudio.Workload.VCTools;^
    includeRecommended;^
    includeOptional


exit


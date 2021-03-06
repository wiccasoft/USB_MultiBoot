@echo off

SET USBDRIVE=
SET TAGFILE=\$WIN_NT$.~BT

:: First Limited Range to Prevent Windows No Drive Alert due to Cardreader
:: For case of Repair Install when Drive not found, than Extended Range and
:: Windows No Drive Alert - Press 4x Continue for Cardreader Drives

FOR %%h IN (C D M N O P Q R S T U V W X Y) DO IF EXIST "%%h:%TAGFILE%" SET USBDRIVE=%%h:

if "%USBDRIVE%" == "" (
   FOR %%h IN (C D E F G H I J K L M N O P Q R S T U V W X Y) DO IF EXIST "%%h:%TAGFILE%" SET USBDRIVE=%%h:
)

IF EXIST %usbdrive%\$WIN_NT$.~LS\$OEM$\$1\nul (
  xcopy %usbdrive%\$WIN_NT$.~LS\$OEM$\$1\*.* "%systemdrive%\" /i /k /e /r /y /h 
)

IF EXIST %usbdrive%\$WIN_NT$.~LS\$OEM$\$$\nul (
  xcopy %usbdrive%\$WIN_NT$.~LS\$OEM$\$$\*.* %systemroot% /i /k /e /r /y /h 
)

ren %USBDRIVE%\txtsetup.sif txtsetup.bak
ren %USBDRIVE%\$WIN_NT$.~BT WIN_NT.BT
ren %USBDRIVE%\$WIN_NT$.~LS WIN_NT.LS

exit
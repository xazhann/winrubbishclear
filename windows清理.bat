@echo off

REM ����ϵͳ����
REM ������wn8��win10ϵͳ

del /S /Q "%appdata%\Microsoft\Windows\Recent\*"
del /S /Q %windir%\temp\*
del /S /Q %temp%\*
del /S /Q %windir%\Help\*
rem del /Q %userprofile%\Downloads\*
del /S /Q "%windir%\SoftwareDistribution\*"

del /S /Q %localappdata%\Google\Update\*
del /S /Q "%windir%\Downloaded Installations\*"

REM ɾ������վ
rd /s /q c:\$Recycle.Bin
rd /s /q d:\$Recycle.Bin
rd /s /q e:\$Recycle.Bin
rd /s /q f:\$Recycle.Bin

REM ����Chrome����
REM rd /s /q "%userprofile%\Local Settings\Application Data\Google\Chrome\User Data\Default\Cache\Cache_Data"
REM rd /s /q "%localappdata%\Google\Chrome\User Data\Default\Cache\Cache_Data"


REM ɾ��ע���ȫ�������
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /f /v "SecurityHealth"

REM ɾ��Adobe��ظ���
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /f /v "AdobeAAMUpdater-1.0"
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /f /v "AdobeGCInvoker-1.0"

REM ɾ��ע��defender
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /f /v "WindowsDefender"


REM ɾ�������ɰ��ļ�
rd /s /q "c:\program files (x86)\DingDing\main\current_new"
rd /s /q "d:\program files (x86)\DingDing\main\current_new"

set a=1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90
for %%i in (%a%) do (
rd /s /q "%userprofile%\AppData\Local\DingTalk_%%i" >nul 2>nul
)

REM ���������ļ���С
REM powercfg hibernate size 40

echo .
set /p choice=  �Ƿ�ɾ��΢�������¼[y/n]:
IF NOT "%choice%"=="" SET choice=%choice:~0,1%
IF "%choice%"=="y" (
	taskkill /f /im WeChat.exe
	rd /q /s "%userprofile%\Documents\WeChat Files\"
)


rem ɾ��win10�Դ��������
powershell -command "get-appxpackage  *municationsapps* | remove-appxpackage"
powershell -command "get-appxpackage  *people* | remove-appxpackage"
powershell -command "get-appxpackage  *zune* | remove-appxpackage"
powershell -command "get-appxpackage  *bing* | remove-appxpackage"
powershell -command "get-appxpackage  *onenote* | remove-appxpackage"
powershell -command "get-appxpackage  *alarms* | remove-appxpackage"
powershell -command "get-appxpackage  *camera* | remove-appxpackage"
powershell -command "get-appxpackage  *photos* | remove-appxpackage"
powershell -command "get-appxpackage  *maps* | remove-appxpackage"
powershell -command "get-appxpackage  *soundrecorder* | remove-appxpackage"
powershell -command "get-appxpackage  *xbox* | remove-appxpackage"
powershell -command "get-appxpackage -allusers Microsoft.549981C3f5f10 | remove-appxpackage"
powershell -command "get-appxpackage *SkypeApp* | remove-appxpackage"
powershell -command "get-appxpackage  *3d* | remove-appxpackage"
powershell -command "get-appxpackage  *bing* | remove-appxpackage"
powershell -command "get-appxpackage *Microsoft.BingWeather* | remove-appxpackage"


REM ����WinSxsĿ¼
Dism /online /Cleanup-Image /StartComponentCleanup
cleanmgr
schtasks
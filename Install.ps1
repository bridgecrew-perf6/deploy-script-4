<#
script#2
1. Check if %localappdata%\dentsure_frontend\dentsure-frontend.exe exists
2. If it exists, do nothing
3. If it doesn't exist, execute the .exe from script #1¨

Define the server share: #>

$AppDownlaodPath = "C:\muntra\"



<# DO NOT EDIT BELOW THIS LINE! #>



$setupFile = (Get-ChildItem -Path $AppDownlaodPath).FullName

$File = "$env:LOCALAPPDATA\dentsure_frontend\dentsure-frontend.exe"


if (Test-Path $File -PathType Leaf) {

    write-host "Muntra present - exit script"


}
else {

     write-host "Muntra not present - executing silent install"
      
      cmd /c ""$setupFile" /s"
      <# create shortcut #>
      $SourceFilePath = "$env:LOCALAPPDATA\dentsure_frontend\dentsure-frontend.exe"
      $ShortcutPath = "$($env:USERPROFILE)\Desktop\Muntra.lnk"
      $WScriptObj = New-Object -ComObject ("WScript.Shell")
      $shortcut = $WscriptObj.CreateShortcut($ShortcutPath)
      $shortcut.TargetPath = $SourceFilePath
      $shortcut.Save()
}
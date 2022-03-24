<#
1. Automatically check if a new version is available from https://muntra-desktop.herokuapp.com/download/win
2. If new version is available, download it and replace old .exe

Define the application download path. Make sure that the download path is EMPTY! #>

$AppDownlaodPath = "C:\muntra\"



<# DO NOT EDIT BELOW THIS LINE! #>



$url="https://muntra-desktop.herokuapp.com/download/win"

# Create download directory if it doesn't exist

If(!(test-path $AppDownlaodPath))
{
      New-Item -ItemType Directory -Force -Path $AppDownlaodPath
}


## Get the file name from the web

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
[Net.ServicePointManager]::ServerCertificateValidationCallback = {$true}

$WebRequest = [System.Net.WebRequest]::Create($url)
$Response = $WebRequest.GetResponse()
$dispositionHeader = $Response.Headers['Content-Disposition']
$disposition = [System.Net.Mime.ContentDisposition]::new($dispositionHeader)
$Response.Dispose()

$filename = $disposition.FileName #this is FileName

# split name and get version digits
$ver1 = $filename.Split("-")
$ver2 = $ver1[2].split(".")

## Get existing file name

$existingFileName = Get-ChildItem -Path $AppDownlaodPath

If(!($existingFileName)) {
    
    write-host "Can't find setup file at the given download path, downloading latest"
    $setupFile = "$AppDownlaodPath$filename"
    (New-Object Net.WebClient).DownloadFile($url, $setupFile)
    
    # exit script
    exit

}
$name = $existingFileName.Name

# split and get version digits
$split1 = $name.Split("-")
$split2 = $split1[2].split(".")

# compare the version and download file if version is higher than existing file

if ($ver2[0] -gt $split2[0]) {
   
   #New version available - delete existing setup file and download latest
   Write-Host "Existing setup file version is older, downloading latest version"
   Remove-Item -Path $existingFileName.FullName
   $setupFile = "$AppDownlaodPath$filename"
   (New-Object Net.WebClient).DownloadFile($url, $setupFile)
}
elseif ($ver2[1] -gt $split2[1]) {

   #New version available - delete existing setup file and download latest
   Remove-Item -Path $existingFileName.FullName
   $setupFile = "$AppDownlaodPath$filename"
   (New-Object Net.WebClient).DownloadFile($url, $setupFile)
}
elseif ($ver2[2] -gt $split2[2]) {

   #New version available - delete existing setup file and download latest
   Remove-Item -Path $existingFileName.FullName
   $setupFile = "$AppDownlaodPath$filename"
   (New-Object Net.WebClient).DownloadFile($url, $setupFile)
}
else {

    Write-Host "Existing setup file is up to date, download aborted"
}


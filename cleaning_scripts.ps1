# явно прописаны пути к основным известным временным каталогам, есть возможность добавить в эту строку пути к каким-то СВОИМ каталогам, которые также требуют периодической очистки
$OtherCleanPathsArr = 'C:\Temp\*', 'C:\Windows\Temp\*', 'C:\swsetup'

# системные пути для очистки
$InProfilesCleanPathsArr = '\AppData\Local\Temp\*', '\AppData\Local\*.auc', '\AppData\Local\Microsoft\Terminal Server Client\Cache\*', '\AppData\Local\Microsoft\Windows\Temporary Internet Files\*', '\AppData\Local\Microsoft\Windows\WER\ReportQueue\*', '\AppData\Local\Microsoft\Windows\Explorer\*'

# пути в профилях для очистки
$Profiles = Get-ChildItem (Get-ItemProperty -path 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\ProfileList').ProfilesDirectory -Exclude 'Administrator', 'Setup', 'Public', 'All Users', 'Default User'
# извлекли из реестра местоположение профилей, сформировали список

ForEach ($Path in $OtherCleanPathsArr) {
Remove-Item -Path $Path -Recurse -Force -ErrorAction SilentlyContinue
}
ForEach ($Profile in $Profiles) {
ForEach ($Path in $InProfilesCleanPathsArr) {
Remove-Item -Path $Profile$Path -Recurse -Force -ErrorAction SilentlyContinue
}
}
write-Host 'Temporary files and selected directories have been deleted successfully!' -ForegroundColor Green

# очистка корзины
$Recycler = (New-Object -ComObject Shell.Application).NameSpace(0xa)
$Recycler.items() | foreach { rm $_.path -force -recurse }
write-Host 'Cleaning the trash has been completed successfully!' -ForegroundColor Green

# очистка браузера chrome
$Items = @('Archived History',
            'Cache\*',
            'Cookies',
            'History',
            'Login Data',
            'Top Sites',
            'Visited Links',
            'Web Data')
$Folder = "$($env:LOCALAPPDATA)\Google\Chrome\User Data\Default"
$Items | % { 
    if (Test-Path "$Folder\$_") {
        Remove-Item "$Folder\$_" 
    }
}
write-Host 'Cleaning the Google Chrome browser has been completed successfully!' -ForegroundColor Green

# очистка браузера edge
rm C:\Users\*\AppData\Local\Packages\Microsoft.MicrosoftEdge_8wekyb3d8bbwe\*
remove-item $env:localappdata\Packages\Microsoft.MicrosoftEdge_8wekyb3d8bbwe\* -recurse -Force 2>$null
Get-AppXPackage -AllUsers -Name Microsoft.MicrosoftEdge | Foreach {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml" -Verbose}
write-Host 'Cleaning the Edge browser has been completed successfully!' -ForegroundColor Green

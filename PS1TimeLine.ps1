$folderPath = "C:\"

Write-Host @"



██████╗ ███████╗ ██╗████████╗██╗███╗   ███╗███████╗██╗     ██╗███╗   ██╗███████╗
██╔══██╗██╔════╝███║╚══██╔══╝██║████╗ ████║██╔════╝██║     ██║████╗  ██║██╔════╝
██████╔╝███████╗╚██║   ██║   ██║██╔████╔██║█████╗  ██║     ██║██╔██╗ ██║█████╗  
██╔═══╝ ╚════██║ ██║   ██║   ██║██║╚██╔╝██║██╔══╝  ██║     ██║██║╚██╗██║██╔══╝  
██║     ███████║ ██║██╗██║   ██║██║ ╚═╝ ██║███████╗███████╗██║██║ ╚████║███████╗
╚═╝     ╚══════╝ ╚═╝╚═╝╚═╝   ╚═╝╚═╝     ╚═╝╚══════╝╚══════╝╚═╝╚═╝  ╚═══╝╚══════╝
                                                                                
                                                     By : Longhoangth18 ( V1.0 )
                                       Morer : https://github.com/longhoangth18
                                                                                
"@ 

$days = Read-Host "[!] Enter the number of days to retrieve files from "

$newFiles = @()
$modifiedFiles = @()

$files = Get-ChildItem -Path $folderPath -Filter * -Recurse -ErrorAction SilentlyContinue -WarningAction SilentlyContinue -InformationAction SilentlyContinue | Where-Object { $_.LastWriteTime -gt (Get-Date).AddDays(-$days) }

foreach ($file in $files) {
    $hash = "N/A"

    if (Test-Path $file.FullName) {
        $hash = Get-FileHash -Path $file.FullName -Algorithm SHA256 -ErrorAction SilentlyContinue -WarningAction SilentlyContinue -InformationAction SilentlyContinue | Select-Object -ExpandProperty Hash
    }

    $fileOwner = (Get-Acl -Path $file.FullName -ErrorAction SilentlyContinue -WarningAction SilentlyContinue -InformationAction SilentlyContinue).Owner

    $createdTime = $file.CreationTime
    $lastWriteTime = $file.LastWriteTime

    if ($lastWriteTime -ne $createdTime) {
        $modifiedDllInfo = [PSCustomObject]@{
            "FilePath" = $file.FullName
            "FileName" = $file.Name
            "Hash" = $hash
            "ThoiGianThem(Time_Add)" = $file.CreationTime
            "ThoiGianChinhSua(Time_Change)" = $lastWriteTime
            "NguoiTao(User_Add)" = $fileOwner
        }
        $modifiedFiles += $modifiedDllInfo
    }

    $dllInfo = [PSCustomObject]@{
        "FilePath" = $file.FullName
        "FileName" = $file.Name
        "Hash" = $hash
        "ThoiGianThem(Time_Add)" = $file.CreationTime
        "NguoiTao(User_Add)" = $fileOwner
    }
    $newFiles += $dllInfo
}

$newFiles | Export-Csv -Path "NewCreate_FilesInfo.csv" -NoTypeInformation
$modifiedFiles | Export-Csv -Path "Modified_FilesInfo.csv" -NoTypeInformation

Write-Host "[!] Done, log exported to file .csv , Happy Hunting "
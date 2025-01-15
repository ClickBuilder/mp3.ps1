$DownloadDir = "E:\music"
$YTDLPDir = "E:\configs\yt-dlp_win"
$FFMpegDir = "E:\configs\ffmpeg-master-latest-win64-gpl-shared\bin"

$AsciiArt = @(
    @"
  ____       U  ___ u                 _   _        _         U  ___ u     _        ____    
 |  _"\       \/"_ \/  __        __  | \ |"|      |"|         \/"_ \/ U  /"\  u   |  _"\   
/| | | |      | | | |  \"\      /"/ <|  \| |>   U | | u       | | | |  \/ _ \/   /| | | |  
U| |_| |\ .-,_| |_| |  /\ \ /\ / /\ U| |\  |u    \| |/__  .-,_| |_| |  / ___ \   U| |_| |\ 
 |____/ u  \_)-\___/  U  \ V  V /  U |_| \_|      |_____|  \_)-\___/  /_/   \_\   |____/ u 
  |||_          \\    .-,_\ /\ /_,-. ||   \\,-.   //  \\        \\     \\    >>    |||_    
 (__)_)        (__)    \_)-'  '-(_/  (_")  (_/   (_")("_)      (__)   (__)  (__)  (__)_)   
"@,
@"
     ; 
     ;;
     ;';.
     ;  ;;
     ;   ;;
     ;    ;;
     ;    ;;
     ;   ;'
     ;  ' 
,;;;,; 
;;;;;;
`;;;;'
"@
)

while ($true) {
    $Host.UI.RawUI.BackgroundColor = 'Black'
    $Host.UI.RawUI.ForegroundColor = 'White'
    Clear-Host
    cls
    $URL = Read-Host "URL"
    $Filename = Read-Host "Name"

    if ($Filename -eq "") {
        $Filename = "%(title)s"
    }

    $Filename = $Filename.ToLower()

    $RandomArt = Get-Random -InputObject $AsciiArt
    Write-Host $RandomArt

    Set-Location -Path $YTDLPDir

    .\yt-dlp.exe -x --audio-format mp3 --audio-quality 0 --ffmpeg-location "$FFMpegDir" --output "$DownloadDir\$Filename.mp3" $URL

    $URL = $null
    $Filename = $null
}

$bf = "D:\backups"
$now = Get-Date
$date = $now.AddDays(-7)


$files = Get-ChildItem -Path $bf -include *.7z -recurse | Where {$_.LastWriteTime -le "$date"}


foreach ($file in $files) {
write-host "Deleting File $file" -foregroundcolor "Red";  Remove-Item $file -ErrorAction SilentlyContinue | out-null

}
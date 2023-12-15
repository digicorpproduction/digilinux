$LogPath = "C:/users/Edney Funeral Home/desktop"
$maxDaystoKeep = -360

$itemsToDelete = Get-ChildItem $LogPath -Recurse -File *.png | Where-Object LastWriteTime -lt ((get-date).AddDays($maxDaystoKeep))

if ($itemsToDelete.Count -gt 0){
    ForEach ($item in $itemsToDelete){
       Get-item $item.FullName | Remove-Item
    }

}
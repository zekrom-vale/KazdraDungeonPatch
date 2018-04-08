Write-Host 'Default: C:\Program Files (x86)\Steam\steamapps\common\Starbound\assets'
Write-Host "Auto-escapes \ and /" -ForegroundColor Yellow
$assets= Read-Host 'Path to starbound assets'
$assets=$assets -replace '[\\/]', '\\'

$item = Get-ChildItem . *.json -rec
$prev= Get-Content 'val.csv'
$prev=$prev -replace '[\\/]', '\\'

foreach ($file in $item){
	(Get-Content $file.PSPath) |
	Foreach-Object { $_ -replace $prev, $assets } |
	Set-Content $file.PSPath
}
$assets| Set-Content 'val.csv'
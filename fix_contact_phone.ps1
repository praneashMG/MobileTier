$path = "d:\Mobile Tire Installation & Flat Repair Service\contact.html"
$content = Get-Content $path -Raw
$content = $content -replace ' scale-x-\[-1\]', ''
Set-Content -Path $path -Value $content
Write-Host "Removed scale-x-[-1] successfully"

$path = "d:\Mobile Tire Installation & Flat Repair Service\service.html"
$content = Get-Content $path -Raw

# Replace the troublesome images with ones that have darker areas
$content = $content -replace 'src="assets/tire-mounting.jpg"', 'src="assets/flat-repair-hero.jpg"'
$content = $content -replace 'src="assets/tire-technician.jpg"', 'src="assets/mobile-service-van-alt.jpg"'

Set-Content -Path $path -Value $content
Write-Host "Images updated"

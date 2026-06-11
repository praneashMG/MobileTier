$files = Get-ChildItem "d:\Mobile Tire Installation & Flat Repair Service\*.html"
foreach ($file in $files) {
    $content = Get-Content $file.FullName -Raw
    
    # Replace the old weak overlay
    $content = $content -replace 'background: linear-gradient\(to bottom, rgba\(0,0,0,0\.2\), rgba\(0,0,0,0\.6\)\);', 'background: linear-gradient(to bottom, rgba(0,0,0,0.3) 0%, rgba(0,0,0,0.8) 50%, rgba(0,0,0,0.95) 100%);'
    
    # Also replace the one I added in service.html just in case, to make it even darker at the top as the user requested ("black overlay for all images")
    $content = $content -replace 'background: linear-gradient\(to bottom, rgba\(0,0,0,0\.1\) 0%, rgba\(0,0,0,0\.8\) 60%, rgba\(0,0,0,0\.95\) 100%\);', 'background: linear-gradient(to bottom, rgba(0,0,0,0.3) 0%, rgba(0,0,0,0.8) 50%, rgba(0,0,0,0.95) 100%);'

    # Add drop-shadow-md to h3 and p inside the cards if not already there, specifically targeting the text-white tags in flatrepair.html
    # This ensures the text pops out. (I did this for service.html already)
    if ($file.Name -eq 'flatrepair.html') {
        $content = $content -replace '<h3 class="text-2xl font-medium mb-2 text-white">', '<h3 class="text-2xl font-medium mb-2 text-white drop-shadow-md">'
        $content = $content -replace '<p class="text-white/90 text-sm mb-5 max-w-sm">', '<p class="text-white/90 text-sm mb-5 max-w-sm drop-shadow-md">'
    }

    Set-Content -Path $file.FullName -Value $content
}
Write-Host "Global overlay update complete."

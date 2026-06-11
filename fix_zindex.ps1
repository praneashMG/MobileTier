$files = Get-ChildItem "d:\Mobile Tire Installation & Flat Repair Service\*.html"
foreach ($file in $files) {
    $content = Get-Content $file.FullName -Raw
    
    # 1. Normalize the gradient just in case there are still spaces in some files (like service.html)
    $content = $content -replace 'background:\s*linear-gradient\(to bottom,\s*rgba\(0,\s*0,\s*0,\s*0\.2\),\s*rgba\(0,\s*0,\s*0,\s*0\.6\)\);', 'background: linear-gradient(to bottom, rgba(0,0,0,0.3) 0%, rgba(0,0,0,0.8) 50%, rgba(0,0,0,0.95) 100%);'
    
    # 2. Fix the z-index issue! 
    # Change ".bg-overlay > * {" or ".bg-overlay>* {" to ".bg-overlay > *:not(img) {"
    # This prevents the image from having a higher z-index than the overlay gradient.
    $content = $content -replace '\.bg-overlay\s*>\s*\*\s*\{', '.bg-overlay > *:not(img) {'

    Set-Content -Path $file.FullName -Value $content
}
Write-Host "Z-index and gradient globally fixed."

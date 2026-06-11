$files = Get-ChildItem "d:\Mobile Tire Installation & Flat Repair Service\*.html"
foreach ($file in $files) {
    $content = Get-Content $file.FullName -Raw
    
    # Replace fa-phone-alt with fa-phone-flip to make it point to the right
    $content = $content -replace 'fa-phone-alt', 'fa-phone-flip'
    
    # If there are any instances where we previously tried to manually flip it, clean it up 
    # e.g., 'transform -scale-x-100' or 'scale-x-[-1]' alongside fa-phone-flip
    $content = $content -replace 'fa-phone-flip transform -scale-x-100', 'fa-phone-flip'
    $content = $content -replace 'fa-phone-flip scale-x-\[-1\]', 'fa-phone-flip'

    Set-Content -Path $file.FullName -Value $content
}
Write-Host "Phone icons flipped right globally."

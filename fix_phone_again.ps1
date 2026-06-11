$files = Get-ChildItem "d:\Mobile Tire Installation & Flat Repair Service\*.html"
foreach ($file in $files) {
    $content = Get-Content $file.FullName -Raw
    
    # Replace fa-phone-flip with fa-phone to use the standard right-pointing phone
    $content = $content -replace 'fa-phone-flip', 'fa-phone'
    
    # Also fix fa-phone-alt if any somehow remained
    $content = $content -replace 'fa-phone-alt', 'fa-phone'

    # Remove any manual flipping that might have been applied to fa-phone
    $content = $content -replace 'fa-phone transform -scale-x-100', 'fa-phone'
    $content = $content -replace 'fa-phone scale-x-\[-1\]', 'fa-phone'

    Set-Content -Path $file.FullName -Value $content
}
Write-Host "Replaced all phone icons with standard fa-phone (which points right)."

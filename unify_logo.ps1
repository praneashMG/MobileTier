$files = Get-ChildItem -Filter *.html -Recurse
foreach ($f in $files) {
    $content = Get-Content $f.FullName -Raw
    
    # Standardize logo to be consistent across header, footer, and mobile drawer
    $logoHtml = '<a href="index.html" class="text-2xl font-bold tracking-tight text-accent" style="font-weight: 700 !important;">Torque</a>'
    
    # 1. Replace header logo
    $content = $content -replace '<a href="index.html" class="text-2xl font-[a-z]+ tracking-tight"><span class="text-accent">Torque</span></a>', $logoHtml
    
    # 2. Replace footer and mobile drawer logo
    $content = $content -replace '<span class="text-2xl font-[a-z]+ text-accent">Torque</span>', $logoHtml
    
    # 3. Replace any remaining text-2xl font-medium tracking-tight (like from my previous run)
    $content = $content -replace '<a href="index.html" class="text-2xl font-medium tracking-tight"><span class="text-accent">Torque</span></a>', $logoHtml
    $content = $content -replace '<span class="text-2xl font-medium text-accent">Torque</span>', $logoHtml
    
    Set-Content -Path $f.FullName -Value $content
}

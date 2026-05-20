$files = Get-ChildItem -Filter *.html -Recurse
foreach ($f in $files) {
    $content = Get-Content $f.FullName -Raw
    
    $logoHtml = '<a href="index.html" class="text-2xl font-bold tracking-tight text-accent" style="font-weight: 700 !important;">Torque</a>'
    
    # regex match for span logo
    $content = $content -replace '(?i)<span\s+class="text-2xl[^"]+text-accent">Torque</span>', $logoHtml
    
    Set-Content -Path $f.FullName -Value $content
}

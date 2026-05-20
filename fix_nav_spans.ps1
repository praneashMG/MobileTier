$files = Get-ChildItem -Filter *.html -Recurse
foreach ($f in $files) {
    $content = Get-Content $f.FullName -Raw
    
    # Remove span:not(.font-medium), from the injected CSS to allow spans to inherit font weights properly
    $content = $content -replace 'p:not\(\.font-medium\), span:not\(\.font-medium\), div\.text-secondary', 'p:not(.font-medium), div.text-secondary'
    
    Set-Content -Path $f.FullName -Value $content
}

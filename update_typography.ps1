$files = Get-ChildItem -Filter *.html -Recurse
foreach ($f in $files) {
    $content = Get-Content $f.FullName -Raw
    $content = $content -replace 'font-black', 'font-medium'
    $content = $content -replace 'font-extrabold', 'font-medium'
    $content = $content -replace 'font-bold', 'font-medium'
    $content = $content -replace 'font-semibold', 'font-medium'
    $content = $content -replace 'text-4xl md:text-6xl', 'text-4xl md:text-5xl'
    $content = $content -replace 'text-5xl md:text-6xl', 'text-4xl md:text-5xl'
    $content = $content -replace 'text-5xl md:text-7xl', 'text-4xl md:text-5xl'
    $content = $content -replace 'text-3xl md:text-5xl', 'text-3xl md:text-4xl'
    
    # Adjust alignment inside cards and container texts
    # This might require some clever regex or just global replacement if standard classes are used
    $content = $content -replace 'class="text-secondary mt-3"', 'class="text-secondary mt-3 max-w-2xl mx-auto"'
    $content = $content -replace 'class="text-secondary text-lg mt-4"', 'class="text-secondary text-lg mt-4 max-w-2xl mx-auto"'
    $content = $content -replace 'class="text-secondary text-sm mt-1"', 'class="text-secondary text-sm mt-1 max-w-2xl mx-auto"'

    Set-Content -Path $f.FullName -Value $content
}

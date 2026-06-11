$files = Get-ChildItem "d:\Mobile Tire Installation & Flat Repair Service\*.html"
$fabHtml = @"
    <!-- Floating Call Button -->
    <a href="tel:8005557655" class="fixed bottom-6 right-6 bg-accent text-white w-14 h-14 rounded-full flex items-center justify-center shadow-2xl z-[90] hover:bg-accent-dark transition-transform hover:scale-110 flex md:hidden" style="box-shadow: 0 4px 14px rgba(224, 90, 42, 0.5);">
        <i class="fas fa-phone-alt text-2xl"></i>
    </a>
</body>
"@

foreach ($file in $files) {
    $content = Get-Content $file.FullName -Raw
    
    # Check if it's already there to avoid duplicates
    if ($content -notmatch 'Floating Call Button') {
        $content = $content -replace '</body>', $fabHtml
        Set-Content -Path $file.FullName -Value $content
    }
}
Write-Host "Floating call button added to all pages."

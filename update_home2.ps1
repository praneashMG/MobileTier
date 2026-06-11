$home2 = "d:\Mobile Tire Installation & Flat Repair Service\home2.html"
if (Test-Path $home2) {
    $content = Get-Content $home2 -Raw

    # 1. Main image replacement
    $content = $content -replace '<img src="assets/mobile-service-van\.jpg" class="w-full h-auto rounded-3xl shadow-2xl border-2 border-accent/30" alt="performance tire van">', '<img src="assets/fd.jpg" class="w-full h-auto rounded-3xl shadow-2xl border-2 border-accent/30" alt="performance tire van">'

    # 2. Real images in Engineered for Speed & Trust
    $content = $content -replace '<div class="w-16 h-16 bg-accent/10 rounded-2xl flex items-center justify-center mx-auto mb-4"><i class="fas fa-microchip text-2xl text-accent"></i></div>', '<img src="assets/team-member-2.jpg" class="w-20 h-20 rounded-full object-cover mx-auto mb-4">'
    $content = $content -replace '<div class="w-16 h-16 bg-accent/10 rounded-2xl flex items-center justify-center mx-auto mb-4"><i class="fas fa-chart-line text-2xl text-accent"></i></div>', '<img src="assets/tire-technician.jpg" class="w-20 h-20 rounded-full object-cover mx-auto mb-4">'
    $content = $content -replace '<div class="w-16 h-16 bg-accent/10 rounded-2xl flex items-center justify-center mx-auto mb-4"><i class="fas fa-shield-alt text-2xl text-accent"></i></div>', '<img src="assets/team-member-3.jpg" class="w-20 h-20 rounded-full object-cover mx-auto mb-4">'
    $content = $content -replace '<div class="w-16 h-16 bg-accent/10 rounded-2xl flex items-center justify-center mx-auto mb-4"><i class="fas fa-receipt text-2xl text-accent"></i></div>', '<img src="assets/service-area-map.jpg" class="w-20 h-20 rounded-full object-cover mx-auto mb-4">'

    # 3. Remove "Compare Performance Tires" layout
    # Use a regex that matches from the section start to the end of the section
    $content = $content -replace '(?s)<!-- ========== SECTION 3: TIRE COMPARISON \+ PERFORMANCE METRICS \(INTERACTIVE\) ========== -->\s*<section id="performance" class="py-20 max-w-7xl mx-auto px-5">.*?</section>\s*', ''

    Set-Content -Path $home2 -Value $content
    Write-Host "Updated home2.html"
}

# 4. Remove unnecessary icons from section headings across all files
$files = Get-ChildItem "d:\Mobile Tire Installation & Flat Repair Service\*.html"
foreach ($file in $files) {
    $path = $file.FullName
    $content = Get-Content $path -Raw
    
    # Target <h2...> or <h3...> followed by <i class="... text-accent mr-2"></i>
    # Many of them look like: <h2 class="text-3xl md:text-4xl font-medium"><i class="fas fa-trophy text-accent mr-2"></i> Top-rated...
    $newContent = $content -replace '(<h[23][^>]*>)\s*<i class="[^"]+text-accent mr-2[^"]*"></i>\s*', '$1'
    
    if ($newContent -cne $content) {
        Set-Content -Path $path -Value $newContent
        Write-Host "Removed icons from headings in $($file.Name)"
    }
}

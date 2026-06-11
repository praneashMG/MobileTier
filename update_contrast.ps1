$path = "d:\Mobile Tire Installation & Flat Repair Service\service.html"
$content = Get-Content $path -Raw

# 1. Update the background overlay to be much darker at the bottom for better contrast
$content = $content -replace 'background: linear-gradient\(to bottom, rgba\(0,0,0,0\.2\), rgba\(0,0,0,0\.6\)\);', 'background: linear-gradient(to bottom, rgba(0,0,0,0.1) 0%, rgba(0,0,0,0.8) 60%, rgba(0,0,0,0.95) 100%);'

# 2. Update the "Learn More" buttons to have better contrast
# From: btn-outline bg-white/10 hover:bg-white text-white hover:text-accent border-white/30
# To: bg-black/60 hover:bg-white text-white hover:text-black border border-white/40 rounded-full transition-all duration-300
$content = $content -replace 'btn-outline bg-white/10 hover:bg-white text-white hover:text-accent border-white/30', 'bg-black/60 hover:bg-white text-white hover:text-black border border-white/40 rounded-full transition-all duration-300'

# Also add text-shadow to the headings and paragraphs inside the overlay just in case
$content = $content -replace '<h3 class="text-2xl font-medium mb-2 text-white">', '<h3 class="text-2xl font-medium mb-2 text-white drop-shadow-md">'
$content = $content -replace '<p class="text-white/90 text-sm mb-5 max-w-sm">', '<p class="text-white/90 text-sm mb-5 max-w-sm drop-shadow-md">'

Set-Content -Path $path -Value $content
Write-Host "Contrast updated"

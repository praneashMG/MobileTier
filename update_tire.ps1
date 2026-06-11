$path = "d:\Mobile Tire Installation & Flat Repair Service\tire.html"
$content = Get-Content $path -Raw

# 1. Replace the Hero image (currently fd.jpg which might be the AI image) with a realistic one
$content = $content -replace '<img src="/assets/fd.jpg"', '<img src="assets/team-member-2.jpg"'
# Just in case it was assets/a1.jpg or something else
$content = $content -replace '<img src="assets/fd.jpg"', '<img src="assets/team-member-2.jpg"'

# 2. Replace the "Our Installation Process" icon grid with a background image grid
$pattern = '(?s)<div class="grid md:grid-cols-2 lg:grid-cols-4 gap-6 mt-12">.*?(?=</div>\s*</section>\s*<!-- ========== SECTION 3: PRICING & PACKAGES ========== -->)'
$replacement = '<div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6 mt-12">
            <!-- Process 1 -->
            <div class="relative bg-overlay rounded-2xl overflow-hidden hover:shadow-2xl transition-all group h-72 flex flex-col justify-end text-left border border-border">
                <img src="assets/team-member-4.jpg" class="absolute inset-0 w-full h-full object-cover group-hover:scale-105 transition-transform duration-500" alt="Inspection">
                <div class="p-6 relative z-10">
                    <div class="w-10 h-10 bg-accent rounded-full flex items-center justify-center mb-3 text-white font-bold">1</div>
                    <h3 class="text-xl font-medium mb-1 text-white drop-shadow-md">Inspection</h3>
                    <p class="text-white/90 text-sm drop-shadow-md">Tread depth, sidewall condition, and existing tire assessment.</p>
                </div>
            </div>
            <!-- Process 2 -->
            <div class="relative bg-overlay rounded-2xl overflow-hidden hover:shadow-2xl transition-all group h-72 flex flex-col justify-end text-left border border-border">
                <img src="assets/tire-repair-service.jpg" class="absolute inset-0 w-full h-full object-cover group-hover:scale-105 transition-transform duration-500" alt="Demounting">
                <div class="p-6 relative z-10">
                    <div class="w-10 h-10 bg-accent rounded-full flex items-center justify-center mb-3 text-white font-bold">2</div>
                    <h3 class="text-xl font-medium mb-1 text-white drop-shadow-md">Demounting</h3>
                    <p class="text-white/90 text-sm drop-shadow-md">Careful removal of old tires from wheels to protect your rims.</p>
                </div>
            </div>
            <!-- Process 3 -->
            <div class="relative bg-overlay rounded-2xl overflow-hidden hover:shadow-2xl transition-all group h-72 flex flex-col justify-end text-left border border-border">
                <img src="assets/tire-mounting.jpg" class="absolute inset-0 w-full h-full object-cover group-hover:scale-105 transition-transform duration-500" alt="Mount & Balance">
                <div class="p-6 relative z-10">
                    <div class="w-10 h-10 bg-accent rounded-full flex items-center justify-center mb-3 text-white font-bold">3</div>
                    <h3 class="text-xl font-medium mb-1 text-white drop-shadow-md">Mount & Balance</h3>
                    <p class="text-white/90 text-sm drop-shadow-md">Precision mounting with computer spin balancing for a smooth ride.</p>
                </div>
            </div>
            <!-- Process 4 -->
            <div class="relative bg-overlay rounded-2xl overflow-hidden hover:shadow-2xl transition-all group h-72 flex flex-col justify-end text-left border border-border">
                <img src="assets/tire-technician.jpg" class="absolute inset-0 w-full h-full object-cover group-hover:scale-105 transition-transform duration-500" alt="Final Check">
                <div class="p-6 relative z-10">
                    <div class="w-10 h-10 bg-accent rounded-full flex items-center justify-center mb-3 text-white font-bold">4</div>
                    <h3 class="text-xl font-medium mb-1 text-white drop-shadow-md">Final Check</h3>
                    <p class="text-white/90 text-sm drop-shadow-md">Torque verification, TPMS reset, and comprehensive road test.</p>
                </div>
            </div>
        </div>'

$content = $content -replace $pattern, $replacement

Set-Content -Path $path -Value $content
Write-Host "Tire Installation page updated"

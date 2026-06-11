$path = "d:\Mobile Tire Installation & Flat Repair Service\service.html"
$content = Get-Content $path -Raw

# Replace main hero image
$content = $content -replace '<img src="assets/tire-repair-service\.jpg"', '<img src="assets/tire-repair-service-alt.jpg"'

# Replace the "What We Offer" section
# Match from the grid start to the closing div before </section>
$pattern = '(?s)<div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6 mt-12">.*?(?=\s*</div>\s*</section>\s*<!-- ========== SECTION 3: HOW IT WORKS ========== -->)'

$replacement = '<div class="grid grid-cols-1 md:grid-cols-2 gap-6 mt-12">
            <!-- Service 1 -->
            <div class="relative bg-overlay rounded-2xl overflow-hidden hover:shadow-2xl transition-all group h-72 flex flex-col justify-end text-left border border-border">
                <img src="assets/tire-mounting.jpg" class="absolute inset-0 w-full h-full object-cover group-hover:scale-105 transition-transform duration-500">
                <div class="p-6 relative z-10">
                    <h3 class="text-2xl font-medium mb-2 text-white">Mobile Installation</h3>
                    <p class="text-white/90 text-sm mb-5 max-w-sm">Full set installation at your home or office. No waiting rooms, no towing.</p>
                    <button class="btn-primary px-5 py-2.5 text-sm"><i class="fas fa-tools mr-1"></i> Book Installation</button>
                </div>
            </div>
            <!-- Service 2 -->
            <div class="relative bg-overlay rounded-2xl overflow-hidden hover:shadow-2xl transition-all group h-72 flex flex-col justify-end text-left border border-border">
                <img src="assets/tire-repair-service.jpg" class="absolute inset-0 w-full h-full object-cover group-hover:scale-105 transition-transform duration-500">
                <div class="p-6 relative z-10">
                    <h3 class="text-2xl font-medium mb-2 text-white">Flat Tire Repair</h3>
                    <p class="text-white/90 text-sm mb-5 max-w-sm">Puncture repairs, plug & patch, sidewall assessment — 24/7 emergency response.</p>
                    <button class="btn-primary px-5 py-2.5 text-sm"><i class="fas fa-truck-fast mr-1"></i> Request Repair</button>
                </div>
            </div>
            <!-- Service 3 -->
            <div class="relative bg-overlay rounded-2xl overflow-hidden hover:shadow-2xl transition-all group h-72 flex flex-col justify-end text-left border border-border">
                <img src="assets/tire-technician.jpg" class="absolute inset-0 w-full h-full object-cover group-hover:scale-105 transition-transform duration-500">
                <div class="p-6 relative z-10">
                    <h3 class="text-2xl font-medium mb-2 text-white">Rotation & Balance</h3>
                    <p class="text-white/90 text-sm mb-5 max-w-sm">Extend tire life with precision balancing and rotation patterns.</p>
                    <button class="btn-outline bg-white/10 hover:bg-white text-white hover:text-accent border-white/30 px-5 py-2.5 text-sm">Learn More</button>
                </div>
            </div>
            <!-- Service 4 -->
            <div class="relative bg-overlay rounded-2xl overflow-hidden hover:shadow-2xl transition-all group h-72 flex flex-col justify-end text-left border border-border">
                <img src="assets/mobile-service-van.jpg" class="absolute inset-0 w-full h-full object-cover group-hover:scale-105 transition-transform duration-500">
                <div class="p-6 relative z-10">
                    <h3 class="text-2xl font-medium mb-2 text-white">TPMS Service</h3>
                    <p class="text-white/90 text-sm mb-5 max-w-sm">Sensor replacement, reprogramming, and system diagnostics.</p>
                    <button class="btn-outline bg-white/10 hover:bg-white text-white hover:text-accent border-white/30 px-5 py-2.5 text-sm">Learn More</button>
                </div>
            </div>
        </div>'

$content = $content -replace $pattern, $replacement

Set-Content -Path $path -Value $content
Write-Host "Service page updated"

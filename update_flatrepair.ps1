$path = "d:\Mobile Tire Installation & Flat Repair Service\flatrepair.html"
$content = Get-Content $path -Raw

# 1. Replace the Grid in Section 2
$pattern1 = '(?s)<div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6 mt-12">.*?(?=</section>)'
$replacement1 = '<div class="grid grid-cols-1 md:grid-cols-2 gap-6 mt-12">
            <!-- Card 1 -->
            <div class="relative bg-overlay rounded-2xl overflow-hidden hover:shadow-2xl transition-all group h-72 flex flex-col justify-end text-left border border-border">
                <img src="assets/tire-repair-service.jpg" class="absolute inset-0 w-full h-full object-cover group-hover:scale-105 transition-transform duration-500" alt="Puncture Repair">
                <div class="p-6 relative z-10">
                    <h3 class="text-2xl font-medium mb-2 text-white drop-shadow-md">Puncture Repair</h3>
                    <p class="text-white/90 text-sm mb-5 max-w-sm drop-shadow-md">Plug & patch combo for nail/screw holes up to 1/4 inch</p>
                    <button class="btn-primary px-5 py-2.5 text-sm"><i class="fas fa-tools mr-1"></i> Book Repair</button>
                </div>
            </div>
            <!-- Card 2 -->
            <div class="relative bg-overlay rounded-2xl overflow-hidden hover:shadow-2xl transition-all group h-72 flex flex-col justify-end text-left border border-border">
                <img src="assets/tire-mounting.jpg" class="absolute inset-0 w-full h-full object-cover group-hover:scale-105 transition-transform duration-500" alt="Spare Installation">
                <div class="p-6 relative z-10">
                    <h3 class="text-2xl font-medium mb-2 text-white drop-shadow-md">Spare Installation</h3>
                    <p class="text-white/90 text-sm mb-5 max-w-sm drop-shadow-md">Mount your spare tire and check pressure</p>
                    <button class="bg-black/60 hover:bg-white text-white hover:text-black border border-white/40 px-5 py-2.5 text-sm rounded-full transition-all duration-300">Learn More</button>
                </div>
            </div>
            <!-- Card 3 -->
            <div class="relative bg-overlay rounded-2xl overflow-hidden hover:shadow-2xl transition-all group h-72 flex flex-col justify-end text-left border border-border">
                <img src="assets/flat-repair-hero.jpg" class="absolute inset-0 w-full h-full object-cover group-hover:scale-105 transition-transform duration-500" alt="Tire Sealant">
                <div class="p-6 relative z-10">
                    <h3 class="text-2xl font-medium mb-2 text-white drop-shadow-md">Tire Sealant</h3>
                    <p class="text-white/90 text-sm mb-5 max-w-sm drop-shadow-md">Temporary fix for minor punctures to get you home</p>
                    <button class="bg-black/60 hover:bg-white text-white hover:text-black border border-white/40 px-5 py-2.5 text-sm rounded-full transition-all duration-300">Learn More</button>
                </div>
            </div>
            <!-- Card 4 -->
            <div class="relative bg-overlay rounded-2xl overflow-hidden hover:shadow-2xl transition-all group h-72 flex flex-col justify-end text-left border border-border">
                <img src="assets/mobile-service-van-alt.jpg" class="absolute inset-0 w-full h-full object-cover group-hover:scale-105 transition-transform duration-500" alt="Towing Coordination">
                <div class="p-6 relative z-10">
                    <h3 class="text-2xl font-medium mb-2 text-white drop-shadow-md">Towing Coordination</h3>
                    <p class="text-white/90 text-sm mb-5 max-w-sm drop-shadow-md">We arrange & dispatch trusted tow partner if needed</p>
                    <button class="bg-black/60 hover:bg-white text-white hover:text-black border border-white/40 px-5 py-2.5 text-sm rounded-full transition-all duration-300">Call for quote</button>
                </div>
            </div>
        </div>
    </div>
'
$content = $content -replace $pattern1, $replacement1

# 2. Replace the 4 images grid in Section 3
$pattern2 = '(?s)<div class="grid grid-cols-2 gap-4 reveal">.*?(?=</div>\s*</div>\s*</section>)'
$replacement2 = '<div class="grid grid-cols-2 gap-4 reveal">
            <img src="assets/tire-technician.jpg" class="rounded-2xl shadow-lg border border-border h-44 w-full object-cover" alt="tire puncture">
            <img src="assets/a1.jpg" class="rounded-2xl shadow-lg border border-border h-44 w-full object-cover mt-6" alt="sports car">
            <img src="assets/tire-crossclimate.jpg" class="rounded-2xl shadow-lg border border-border h-44 w-full object-cover" alt="tire thread">
            <img src="assets/team-member-4.jpg" class="rounded-2xl shadow-lg border border-border h-44 w-full object-cover -mt-6" alt="technician inspecting">
        '
$content = $content -replace $pattern2, $replacement2

Set-Content -Path $path -Value $content
Write-Host "Flat repair page updated"

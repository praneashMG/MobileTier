$files = @("tire.html", "service.html", "pricing.html", "index.html", "home2.html", "flatrepair.html", "contact.html", "about.html")
foreach ($file in $files) {
    $path = "d:\Mobile Tire Installation & Flat Repair Service\$file"
    if (Test-Path $path) {
        $content = Get-Content -Path $path -Raw

        # Desktop Nav Order
        $content = $content -replace '(?s)<a href="service\.html" class="nav-link">Services</a>\s*<a href="tire\.html" class="nav-link">Tire Installation</a>\s*<a href="flatrepair\.html" class="nav-link">Flat Repair</a>\s*<a href="pricing\.html" class="nav-link">Pricing</a>\s*<a href="about\.html" class="nav-link">About Us</a>\s*<a href="contact\.html" class="nav-link">Contact</a>', '<a href="about.html" class="nav-link">About Us</a>
                <a href="service.html" class="nav-link">Services</a>
                <a href="flatrepair.html" class="nav-link">Flat Repair</a>
                <a href="tire.html" class="nav-link">Tire Installation</a>
                <a href="pricing.html" class="nav-link">Pricing</a>
                <a href="contact.html" class="nav-link">Contact</a>'

        # Mobile Nav Order
        $content = $content -replace '(?s)<a href="service\.html" class="py-2 font-medium">Services</a>\s*<a href="tire\.html" class="py-2 font-medium">Tire Installation</a>\s*<a href="flatrepair\.html" class="py-2 font-medium">Flat Repair</a>\s*<a href="pricing\.html" class="py-2 font-medium">Pricing</a>\s*<a href="about\.html" class="py-2 font-medium">About Us</a>\s*<a href="contact\.html" class="py-2 font-medium">Contact</a>', '<a href="about.html" class="py-2 font-medium">About Us</a>
                <a href="service.html" class="py-2 font-medium">Services</a>
                <a href="flatrepair.html" class="py-2 font-medium">Flat Repair</a>
                <a href="tire.html" class="py-2 font-medium">Tire Installation</a>
                <a href="pricing.html" class="py-2 font-medium">Pricing</a>
                <a href="contact.html" class="py-2 font-medium">Contact</a>'

        # Icon and Login Move
        $content = $content -replace '(?s)<div class="dropdown-wrapper" id="user-dropdown">\s*<button class="dropdown-toggle text-sm font-medium inline-flex items-center gap-1">\s*<i class="fa-regular fa-user-circle text-xl leading-none"></i><span>Account</span>\s*</button>\s*<div class="dropdown-menu">\s*<a href="[^"]+"><i class="fas fa-sign-in-alt mr-2"></i> Login</a>\s*<a href="([^"]+)"><i class="fas fa-user-plus mr-2"></i> Signup</a>\s*</div>\s*</div>\s*<button id="theme-toggle" class="p-2 rounded-full hover:bg-accent\/10"><i\s*class="fas fa-moon light-icon"></i><i class="fas fa-sun dark-icon hidden"></i></button>\s*<button id="lang-icon" class="p-2 rounded-full hover:bg-accent\/10"><i class="fas fa-globe"></i></button>', '<a href="login.html" class="text-sm font-medium hover:text-accent transition">Login</a>
                <div class="dropdown-wrapper" id="user-dropdown">
                    <button class="dropdown-toggle text-sm font-medium inline-flex items-center gap-1">
                        <i class="fa-regular fa-user-circle text-xl leading-none"></i><span>Account</span>
                    </button>
                    <div class="dropdown-menu">
                        <a href="$1"><i class="fas fa-user-plus mr-2"></i> Signup</a>
                    </div>
                </div>
                <button id="theme-toggle" class="p-2 rounded-full hover:bg-accent/10"><i
                        class="fas fa-moon light-icon"></i><i class="fas fa-sun dark-icon hidden"></i></button>
                <button id="lang-icon" class="p-2 rounded-full hover:bg-accent/10"><i class="fas fa-exchange-alt"></i></button>'

        Set-Content -Path $path -Value $content
        Write-Host "Updated $file"
    }
}

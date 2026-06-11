$files = @("tire.html", "service.html", "pricing.html", "index.html", "home2.html", "flatrepair.html", "contact.html", "about.html")
foreach ($file in $files) {
    $path = "d:\Mobile Tire Installation & Flat Repair Service\$file"
    if (Test-Path $path) {
        $content = Get-Content -Path $path -Raw

        # Desktop Login/Signup Button Replacement
        $content = $content -replace '(?s)<a href="login\.html" class="text-sm font-medium hover:text-accent transition">Login</a>\s*<div class="dropdown-wrapper" id="user-dropdown">\s*<button class="dropdown-toggle text-sm font-medium inline-flex items-center gap-1">\s*<i class="fa-regular fa-user-circle text-xl leading-none"></i><span>Account</span>\s*</button>\s*<div class="dropdown-menu">\s*<a href="[^"]+"><i class="fas fa-user-plus mr-2"></i> Signup</a>\s*</div>\s*</div>', '<a href="login.html" class="btn-outline px-5 py-2 text-sm font-medium"><i class="fas fa-sign-in-alt mr-1"></i> Login</a>
                <a href="signup.html" class="btn-primary px-5 py-2 text-sm font-medium"><i class="fas fa-user-plus mr-1"></i> Signup</a>'

        Set-Content -Path $path -Value $content
        Write-Host "Updated $file"
    }
}

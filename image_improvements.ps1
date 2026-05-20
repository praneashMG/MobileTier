$files = Get-ChildItem -Filter *.html -Recurse
$cssBlock = @"
    <style id="image-improvements">
        /* Prevent image distortion globally */
        img:not([src*="fav.png"]):not(.object-contain) {
            object-fit: cover !important;
        }
        
        /* Ensure proper background overlays for readability (apply to containers if needed) */
        .bg-overlay {
            position: relative;
        }
        .bg-overlay::before {
            content: '';
            position: absolute;
            inset: 0;
            background: linear-gradient(to bottom, rgba(0,0,0,0.2), rgba(0,0,0,0.6));
            border-radius: inherit;
            pointer-events: none;
            z-index: 1;
        }
        .bg-overlay > * {
            position: relative;
            z-index: 2;
        }
    </style>
</head>
"@

foreach ($f in $files) {
    $content = Get-Content $f.FullName -Raw
    
    # Inject CSS
    if ($content -notmatch 'id="image-improvements"') {
        $content = $content -replace '</head>', $cssBlock
    }
    
    # Simple replacement to avoid obvious image repeats across pages
    # E.g. replacing tire-mounting in flatrepair
    if ($f.Name -eq 'flatrepair.html') {
        $content = $content -replace 'assets/tire-mounting.jpg', 'assets/tire-repair-service-alt.jpg'
        $content = $content -replace 'assets/tire-ecocontact.jpg', 'assets/fd.jpg'
    }
    
    if ($f.Name -eq 'service.html') {
        $content = $content -replace 'assets/pricing-hero.jpg', 'assets/service-area-map.jpg'
    }

    Set-Content -Path $f.FullName -Value $content
}

$files = Get-ChildItem -Filter *.html -Recurse
$cssBlock = @"
    <style id="cta-improvements">
        /* Primary CTA Highlights */
        .btn-primary {
            box-shadow: 0 4px 12px 0 rgba(224, 90, 42, 0.4);
            color: #ffffff !important;
        }
        html[data-theme='dark'] .btn-primary {
            box-shadow: 0 4px 12px 0 rgba(249, 115, 22, 0.3);
            color: #0f172a !important; /* High contrast in dark mode */
            font-weight: 600 !important;
        }
        
        /* Hover Color Consistency & Contrast */
        .btn-primary:hover {
            background-color: var(--accent-dark) !important;
            transform: translateY(-1px) scale(1.02);
            box-shadow: 0 6px 16px 0 rgba(224, 90, 42, 0.5);
        }
        html[data-theme='dark'] .btn-primary:hover {
            box-shadow: 0 6px 16px 0 rgba(249, 115, 22, 0.4);
        }
        
        .btn-outline {
            color: var(--accent) !important;
            border-color: var(--accent) !important;
        }
        .btn-outline:hover {
            background-color: var(--accent) !important;
            color: #ffffff !important;
            transform: translateY(-1px);
        }
        html[data-theme='dark'] .btn-outline:hover {
            color: #0f172a !important; /* High contrast in dark mode */
        }

        /* Align CTA buttons consistently inside cards/grids */
        .tire-card, .dashboard-card {
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            height: 100%;
        }
        .tire-card > div:last-child, .dashboard-card > div:last-child, .dashboard-card > button:last-child {
            margin-top: auto;
        }
    </style>
</head>
"@

foreach ($f in $files) {
    $content = Get-Content $f.FullName -Raw
    
    # Inject CSS
    if ($content -notmatch 'id="cta-improvements"') {
        $content = $content -replace '</head>', $cssBlock
    }
    
    # Meaningful CTA Names
    $content = $content -replace '>Click Here<', '>View Details<'
    $content = $content -replace '>Submit<', '>Submit Request<'
    $content = $content -replace '>More Info<', '>Learn More<'
    
    Set-Content -Path $f.FullName -Value $content
}

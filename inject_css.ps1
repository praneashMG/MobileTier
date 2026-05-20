$files = Get-ChildItem -Filter *.html -Recurse
$cssBlock = @"
    <style id="typography-alignment">
        /* Typography Alignment & Consistency Overrides */
        h1, h2, h3, h4, h5, h6 {
            font-weight: 500 !important;
        }
        /* Keep paragraph weights 400-500 */
        p:not(.font-medium), span:not(.font-medium), div.text-secondary {
            font-weight: 400 !important;
        }
        /* Ensure proper text alignment inside cards */
        .tire-card, .bg-card, .card {
            text-align: left !important;
        }
        .text-center .tire-card, .text-center .bg-card {
            text-align: left !important;
        }
        /* Reduce overly wide paragraphs inside containers for readability */
        .container p, section > div > p.text-secondary {
            max-width: 65ch;
            margin-left: auto;
            margin-right: auto;
        }
        .tire-card p, .bg-card p, .card p, .text-left p {
            margin-left: 0 !important;
            margin-right: 0 !important;
            max-width: none !important;
        }
    </style>
</head>
"@

foreach ($f in $files) {
    $content = Get-Content $f.FullName -Raw
    if ($content -notmatch 'id="typography-alignment"') {
        $content = $content -replace '</head>', $cssBlock
        Set-Content -Path $f.FullName -Value $content
    }
}

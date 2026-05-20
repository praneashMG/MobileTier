$files = Get-ChildItem -Filter *.html -Recurse
$cssBlock = @"
    <style id="responsive-fixes">
        /* Guarantee text wrapping on small screens */
        body {
            overflow-wrap: break-word;
            word-wrap: break-word;
            -ms-word-break: break-all;
            word-break: break-word;
        }
    </style>
</head>
"@

foreach ($f in $files) {
    $content = Get-Content $f.FullName -Raw
    
    if ($content -notmatch 'id="responsive-fixes"') {
        $content = $content -replace '</head>', $cssBlock
        Set-Content -Path $f.FullName -Value $content
    }
}

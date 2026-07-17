[CmdletBinding()]
param(
    [string]$SourceRoot = (Split-Path -Parent $PSScriptRoot),
    [string]$OutputDirectory = (Join-Path $PSScriptRoot 'dist')
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$utf8NoBom = [System.Text.UTF8Encoding]::new($false)
$sourceRootPath = (Resolve-Path -LiteralPath $SourceRoot).Path
$outputPath = [System.IO.Path]::GetFullPath($OutputDirectory)

function Write-Utf8File {
    param(
        [Parameter(Mandatory)] [string]$Path,
        [Parameter(Mandatory)] [string]$Content
    )

    [System.IO.File]::WriteAllText($Path, $Content, $script:utf8NoBom)
}

function Get-TextHash {
    param([Parameter(Mandatory)] [string]$Text)

    $bytes = $script:utf8NoBom.GetBytes($Text)
    $hash = [System.Security.Cryptography.SHA256]::HashData($bytes)
    return [Convert]::ToHexString($hash).ToLowerInvariant()
}

function Get-FrontmatterValue {
    param(
        [Parameter(Mandatory)] [string]$Text,
        [Parameter(Mandatory)] [string]$Name
    )

    $head = (($Text -replace "`r`n", "`n") -split "`n" | Select-Object -First 50) -join "`n"
    $match = [regex]::Match(
        $head,
        '(?im)^' + [regex]::Escape($Name) + ':\s*["'']?(.*?)["'']?\s*$'
    )
    if ($match.Success) {
        return $match.Groups[1].Value.Trim()
    }
    return $null
}

function Remove-Frontmatter {
    param([Parameter(Mandatory)] [string]$Text)

    $normalized = $Text -replace "`r`n", "`n"
    $lines = $normalized -split "`n"
    if ($lines.Count -eq 0 -or $lines[0].Trim() -ne '---') {
        return $normalized.Trim()
    }

    $cursor = 0
    while ($cursor -lt $lines.Count -and $lines[$cursor].Trim() -eq '---') {
        $cursor++
    }

    $closing = -1
    for ($index = $cursor; $index -lt [Math]::Min($lines.Count, 60); $index++) {
        if ($lines[$index].Trim() -eq '---') {
            $closing = $index
            break
        }
    }

    if ($closing -lt 0) {
        return $normalized.Trim()
    }

    return (($lines[($closing + 1)..($lines.Count - 1)]) -join "`n").Trim()
}

function Remove-ImageOnlyLines {
    param([Parameter(Mandatory)] [string]$Text)

    $kept = foreach ($line in (($Text -replace "`r`n", "`n") -split "`n")) {
        $trimmed = $line.Trim()
        $isMarkdownImage = $trimmed -match '^(?:\[)?!\[[^\]]*\]\([^)]+\)(?:\]\([^)]+\))?$'
        $isHtmlImage = $trimmed -match '^<img\s+[^>]*>\s*$'
        if (-not $isMarkdownImage -and -not $isHtmlImage) {
            $line
        }
    }
    return (($kept -join "`n") -replace "`n{3,}", "`n`n").Trim()
}

function Get-ImageReferences {
    param(
        [Parameter(Mandatory)] [string]$Text,
        [Parameter(Mandatory)] [string]$RelativePath
    )

    $lineNumber = 0
    foreach ($line in (($Text -replace "`r`n", "`n") -split "`n")) {
        $lineNumber++
        foreach ($match in [regex]::Matches($line, '!\[[^\]]*\]\(([^\)]+)\)')) {
            [PSCustomObject]@{
                source_path = $RelativePath
                source_line = $lineNumber
                target = $match.Groups[1].Value
            }
        }
    }
}

function Get-SourceRecord {
    param([Parameter(Mandatory)] [System.IO.FileInfo]$File)

    $text = [System.IO.File]::ReadAllText($File.FullName)
    $relativePath = [System.IO.Path]::GetRelativePath($script:sourceRootPath, $File.FullName).Replace('\', '/')
    $category = $relativePath.Split('/')[0]
    $title = Get-FrontmatterValue -Text $text -Name 'title'
    if (-not $title) {
        $heading = [regex]::Match($text, '(?m)^#\s+(.+)$')
        $title = if ($heading.Success) { $heading.Groups[1].Value.Trim('* ').Trim() } else { $File.BaseName }
    }
    $date = Get-FrontmatterValue -Text $text -Name 'date'
    $subtitle = Get-FrontmatterValue -Text $text -Name 'subtitle'
    $status = Get-FrontmatterValue -Text $text -Name 'context_status'
    if (-not $status) {
        $status = if ($File.Name -match 'outline|knowledge') { 'planned-or-reference' } else { 'unspecified' }
    }

    $chapter = $null
    $chapterMatch = [regex]::Match([string]$subtitle, '(?i)\bchapter\s*:?[\s-]*(\d+)')
    if ($chapterMatch.Success) {
        $chapter = [int]$chapterMatch.Groups[1].Value
    }

    $body = Remove-ImageOnlyLines -Text (Remove-Frontmatter -Text $text)
    $wordCount = ($body -split '\s+' | Where-Object { $_ }).Count

    return [PSCustomObject]@{
        File = $File
        Path = $relativePath
        Category = $category
        Title = $title
        Subtitle = $subtitle
        Date = $date
        Status = $status
        Chapter = $chapter
        RawText = $text
        Body = $body
        WordCount = $wordCount
        Sha256 = Get-TextHash -Text $text
    }
}

function Format-SourceRecord {
    param([Parameter(Mandatory)] $Record)

    $metadata = @(
        '<!-- SOURCE BEGIN',
        ('path: ' + $Record.Path),
        ('category: ' + $Record.Category),
        ('title: ' + $Record.Title),
        ('status: ' + $Record.Status)
    )
    if ($Record.Subtitle) { $metadata += ('subtitle: ' + $Record.Subtitle) }
    if ($Record.Date) { $metadata += ('publication_date: ' + $Record.Date) }
    if ($null -ne $Record.Chapter) { $metadata += ('chapter: ' + $Record.Chapter) }
    $metadata += '-->'

    return @"
$($metadata -join "`n")

# $($Record.Title)

$($Record.Body)

<!-- SOURCE END: $($Record.Path) -->
"@.Trim()
}

function New-Pack {
    param(
        [Parameter(Mandatory)] [string]$FileName,
        [Parameter(Mandatory)] [string]$Heading,
        [Parameter(Mandatory)] [string]$Description,
        [Parameter(Mandatory)] [array]$Records
    )

    $sections = $Records | ForEach-Object { Format-SourceRecord -Record $_ }
    $content = @"
# $Heading

$Description

$($sections -join "`n`n---`n`n")
"@.Trim() + "`n"
    Write-Utf8File -Path (Join-Path $script:outputPath $FileName) -Content $content
    return $content
}

[System.IO.Directory]::CreateDirectory($outputPath) | Out-Null

$sourceFiles = Get-ChildItem -LiteralPath $sourceRootPath -Recurse -File -Filter '*.md' |
    Where-Object {
        $_.FullName -notlike ((Join-Path $sourceRootPath 'llm-context') + '*') -and
        $_.Name -ne 'index.md' -and
        $_.Name -ne 'charactersheet-template.md'
    }
$records = @($sourceFiles | ForEach-Object { Get-SourceRecord -File $_ })

$instructions = [System.IO.File]::ReadAllText((Join-Path $PSScriptRoot 'instructions.md')).Trim()
$overrides = [System.IO.File]::ReadAllText((Join-Path $PSScriptRoot 'canon-overrides.md')).Trim()
$guide = $instructions + "`n`n---`n`n" + $overrides + "`n"
Write-Utf8File -Path (Join-Path $outputPath '00-context-guide.md') -Content $guide

$lore = @($records | Where-Object Category -eq 'lore' | Sort-Object Path)
$characters = @($records | Where-Object Category -eq 'characters' | Sort-Object Title)
$mainSeries = @($records | Where-Object { $_.Category -eq 'stories' -and $null -ne $_.Chapter } | Sort-Object Chapter, Date, Path)
$otherStories = @($records | Where-Object { $_.Category -eq 'stories' -and $null -eq $_.Chapter } | Sort-Object Date, Path)

$pack10 = New-Pack -FileName '10-lore.md' -Heading 'Superbear lore and planning sources' -Description 'Lore, rules, reference documents, and arc plans. A planning document describes intent, not a completed event.' -Records $lore
$pack20 = New-Pack -FileName '20-characters.md' -Heading 'Superbear character sources' -Description 'Character reference sheets in alphabetical title order.' -Records $characters
$pack30 = New-Pack -FileName '30-main-series.md' -Heading 'Superbear main series' -Description 'Numbered Superbear chapters in chapter order. Publication dates are metadata, not in-world dates.' -Records $mainSeries
$pack40 = New-Pack -FileName '40-other-stories.md' -Heading 'Superbear standalone and spin-off stories' -Description 'Unnumbered stories in publication order. Their continuity is unspecified unless the source says otherwise.' -Records $otherStories

$imageReferences = @($records | ForEach-Object { Get-ImageReferences -Text $_.RawText -RelativePath $_.Path })
$localAssets = @(Get-ChildItem -LiteralPath (Join-Path $sourceRootPath 'assets/images') -Recurse -File | Sort-Object FullName | ForEach-Object {
    [System.IO.Path]::GetRelativePath($sourceRootPath, $_.FullName).Replace('\', '/')
})
$visualLines = @(
    '# Superbear visual reference index',
    '',
    'This is a provenance index, not a semantic description of the images. Do not infer visual canon from filenames.',
    '',
    '## Image references found in Markdown',
    '',
    '| Source | Line | Target |',
    '| --- | ---: | --- |'
)
foreach ($reference in $imageReferences) {
    $safeTarget = $reference.target.Replace('|', '\|')
    $visualLines += "| ``$($reference.source_path)`` | $($reference.source_line) | $safeTarget |"
}
$visualLines += @('', '## Local visual assets', '')
foreach ($asset in $localAssets) {
    $visualLines += "- ``$asset``"
}
Write-Utf8File -Path (Join-Path $outputPath '50-visual-reference-index.md') -Content (($visualLines -join "`n") + "`n")

$fullCorpus = @(
    '# Superbear full text corpus',
    '',
    'Single-file context alternative. Do not upload this together with the separate numbered text packs.',
    '',
    $guide.Trim(),
    '---',
    $pack10.Trim(),
    '---',
    $pack20.Trim(),
    '---',
    $pack30.Trim(),
    '---',
    $pack40.Trim()
) -join "`n`n"
Write-Utf8File -Path (Join-Path $outputPath '90-full-text-corpus.md') -Content ($fullCorpus + "`n")

$manifest = [ordered]@{
    schema_version = 1
    source_root = '.'
    totals = [ordered]@{
        source_files = $records.Count
        source_words_without_image_only_lines = ($records | Measure-Object WordCount -Sum).Sum
        markdown_image_references = $imageReferences.Count
        local_visual_assets = $localAssets.Count
    }
    sources = @($records | Sort-Object Path | ForEach-Object {
        [ordered]@{
            path = $_.Path
            category = $_.Category
            title = $_.Title
            subtitle = $_.Subtitle
            publication_date = $_.Date
            context_status = $_.Status
            chapter = $_.Chapter
            words_without_image_only_lines = $_.WordCount
            sha256 = $_.Sha256
        }
    })
}
Write-Utf8File -Path (Join-Path $outputPath 'manifest.json') -Content (($manifest | ConvertTo-Json -Depth 8) + "`n")

Write-Host "Built $($records.Count) sources in $outputPath"
Write-Host "Text words (image-only lines removed): $($manifest.totals.source_words_without_image_only_lines)"
Write-Host "Markdown image references: $($manifest.totals.markdown_image_references)"
Write-Host "Local visual assets: $($manifest.totals.local_visual_assets)"

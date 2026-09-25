$ErrorActionPreference = 'Stop'
$root = 'C:\Users\sahil\Documents\Default Project'
$out = Join-Path $root '1to9finalpdfsfs.pptx'
$pageDir = Join-Path $root 'assets\pdf-pages'
$pages = Get-ChildItem -LiteralPath $pageDir -Filter 'page-*-slide.png' | Sort-Object Name

if ($pages.Count -ne 6) { throw "Expected 6 rendered PDF pages, found $($pages.Count)." }

$ppt = New-Object -ComObject PowerPoint.Application
$pres = $ppt.Presentations.Add()
$pres.PageSetup.SlideWidth = 960
$pres.PageSetup.SlideHeight = 540

for ($i = 0; $i -lt $pages.Count; $i++) {
    $slide = $pres.Slides.Add($i + 1, 12)
    $slide.FollowMasterBackground = 0
    $slide.Background.Fill.Solid()
    $slide.Background.Fill.ForeColor.RGB = 16777215
    $null = $slide.Shapes.AddPicture($pages[$i].FullName, 0, -1, 0, 0, 960, 540)
}

if (Test-Path -LiteralPath $out) { Remove-Item -LiteralPath $out -Force }
$pres.SaveAs($out, 24)
$pres.Close()
$ppt.Quit()
[System.Runtime.Interopservices.Marshal]::ReleaseComObject($pres) | Out-Null
[System.Runtime.Interopservices.Marshal]::ReleaseComObject($ppt) | Out-Null
[GC]::Collect()
[GC]::WaitForPendingFinalizers()
Write-Output "Created $out"

$ErrorActionPreference = 'Stop'

$root = 'C:\Users\sahil\Documents\Default Project'
$out = Join-Path $root 'Surplus-to-Shelter-6-slide-pitch-deck.pptx'
$pdf = Join-Path $root 'Surplus-to-Shelter-6-slide-pitch-deck.pdf'
$appShot = Join-Path $root 'assets\app-command-center.png'

function Get-Rgb([int]$r, [int]$g, [int]$b) { return $r + (256 * $g) + (65536 * $b) }

$cream = Get-Rgb 244 238 222
$paper = Get-Rgb 252 249 240
$forest = Get-Rgb 15 63 52
$forestDeep = Get-Rgb 10 39 32
$rust = Get-Rgb 198 90 55
$rustDark = Get-Rgb 151 55 32
$ink = Get-Rgb 29 42 36
$muted = Get-Rgb 111 111 98
$line = Get-Rgb 199 190 171
$red = Get-Rgb 186 50 40
$redLight = Get-Rgb 255 229 224
$amber = Get-Rgb 234 164 47
$greenLight = Get-Rgb 224 244 232
$white = Get-Rgb 255 252 244

$serif = 'Georgia'
$sans = 'Aptos'
$mono = 'Consolas'

function Set-SlideBackground($slide, [int]$color) {
    $slide.FollowMasterBackground = 0
    $slide.Background.Fill.Solid()
    $slide.Background.Fill.ForeColor.RGB = $color
    $slide.Background.Fill.Transparency = 0
}

function Add-Rect($slide, [double]$x, [double]$y, [double]$w, [double]$h, [int]$fill, [int]$lineColor = -1, [double]$transparency = 0, [int]$shapeType = 1) {
    $shape = $slide.Shapes.AddShape($shapeType, $x, $y, $w, $h)
    $shape.Fill.Solid()
    $shape.Fill.ForeColor.RGB = $fill
    $shape.Fill.Transparency = $transparency
    if ($lineColor -lt 0) {
        $shape.Line.Visible = 0
    } else {
        $shape.Line.Visible = -1
        $shape.Line.ForeColor.RGB = $lineColor
        $shape.Line.Weight = 0.75
    }
}

function Add-Text($slide, [string]$text, [double]$x, [double]$y, [double]$w, [double]$h, [double]$size = 12, [string]$font = $sans, [int]$color = $ink, [bool]$bold = $false, [bool]$italic = $false, [int]$align = 1, [int]$valign = 1) {
    $shape = $slide.Shapes.AddTextbox(1, $x, $y, $w, $h)
    $shape.TextFrame.MarginLeft = 0
    $shape.TextFrame.MarginRight = 0
    $shape.TextFrame.MarginTop = 0
    $shape.TextFrame.MarginBottom = 0
    $shape.TextFrame.WordWrap = -1
    $shape.TextFrame.AutoSize = 0
    $shape.TextFrame.VerticalAnchor = $valign
    $shape.TextFrame.TextRange.Text = $text
    $shape.TextFrame.TextRange.Font.Name = $font
    $shape.TextFrame.TextRange.Font.Size = $size
    $shape.TextFrame.TextRange.Font.Color.RGB = $color
    if ($bold) { $shape.TextFrame.TextRange.Font.Bold = -1 } else { $shape.TextFrame.TextRange.Font.Bold = 0 }
    if ($italic) { $shape.TextFrame.TextRange.Font.Italic = -1 } else { $shape.TextFrame.TextRange.Font.Italic = 0 }
    $shape.TextFrame.TextRange.ParagraphFormat.Alignment = $align
    $shape.TextFrame.TextRange.ParagraphFormat.SpaceAfter = 0
    $shape.TextFrame.TextRange.ParagraphFormat.SpaceBefore = 0
}

function Add-Line($slide, [double]$x1, [double]$y1, [double]$x2, [double]$y2, [int]$color = $line, [double]$weight = 0.75, [bool]$dash = $false) {
    $lineShape = $slide.Shapes.AddLine($x1, $y1, $x2, $y2)
    $lineShape.Line.ForeColor.RGB = $color
    $lineShape.Line.Weight = $weight
    if ($dash) { $lineShape.Line.DashStyle = 4 }
}

function Add-Circle($slide, [double]$x, [double]$y, [double]$d, [int]$fill, [int]$lineColor = -1, [double]$lineWeight = 0.75) {
    Add-Rect $slide $x $y $d $d $fill $lineColor 0 9
}

function Add-RoundedRect($slide, [double]$x, [double]$y, [double]$w, [double]$h, [int]$fill, [int]$lineColor = -1) {
    $shape = $slide.Shapes.AddShape(5, $x, $y, $w, $h)
    $shape.Fill.Solid()
    $shape.Fill.ForeColor.RGB = $fill
    if ($lineColor -lt 0) {
        $shape.Line.Visible = 0
    } else {
        $shape.Line.Visible = -1
        $shape.Line.ForeColor.RGB = $lineColor
        $shape.Line.Weight = 0.75
    }
    return $shape
}

function Add-Image($slide, [string]$path, [double]$x, [double]$y, [double]$w, [double]$h) {
    $null = $slide.Shapes.AddPicture($path, 0, -1, $x, $y, $w, $h)
}

function Add-Kicker($slide, [string]$left, [string]$right) {
    Add-Text $slide $left 34 19 390 16 8.5 $mono $forest $true $false 1 3
    Add-Text $slide $right 550 19 376 16 8.5 $mono $rust $true $false 3 3
    Add-Line $slide 34 43 926 43 $line 0.75 $false
}

function Add-Footer($slide, [string]$rightLabel, [int]$page) {
    Add-Line $slide 34 506 926 506 $line 0.55 $false
    Add-Text $slide 'SURPLUS-TO-SHELTER  /  TECH CYPHER' 34 514 260 14 7.5 $mono $muted $true $false 1 3
    Add-Text $slide $rightLabel 350 514 460 14 7.5 $mono $muted $false $false 3 3
    Add-Text $slide ('0' + $page + ' / 06') 840 514 86 14 7.5 $mono $forest $true $false 3 3
}

function Add-SectionTitle($slide, [string]$title, [string]$accent = '') {
    if ($accent) {
        Add-Text $slide $title 34 69 720 48 24 $serif $ink $true $false 1 1
        Add-Text $slide $accent 690 69 236 48 24 $serif $rust $true $true 1 1
    } else {
        Add-Text $slide $title 34 69 892 48 24 $serif $ink $true $false 1 1
    }
}

function Add-Metric($slide, [string]$metric, [string]$unit, [double]$x, [double]$y, [double]$w, [int]$metricColor = $ink) {
    Add-Text $slide $metric $x $y $w 48 35 $serif $metricColor $true $false 1 1
    if ($unit) { Add-Text $slide $unit ($x + $w - 40) ($y + 14) 40 20 11 $mono $rust $true $false 3 1 }
}

function Add-Source($slide, [string]$text) {
    Add-Text $slide $text 34 486 892 12 6.8 $mono $muted $false $false 1 3
}

# PowerPoint setup
$ppt = New-Object -ComObject PowerPoint.Application
$pres = $ppt.Presentations.Add()
$pres.PageSetup.SlideWidth = 960
$pres.PageSetup.SlideHeight = 540

# Slide 1 — Cover
$slide = $pres.Slides.Add(1, 12)
Set-SlideBackground $slide $paper
Add-Rect $slide 700 0 260 540 $forest -1 0 1
Add-Rect $slide 700 0 260 540 $forest 0 0 1
Add-Text $slide 'TRACK A  /  NGO  /  SOCIAL IMPACT' 46 34 340 18 8.5 $mono $forest $true $false 1 3
Add-Text $slide 'JAIPUR  /  PILOT RUN' 495 34 170 18 8.5 $mono $muted $true $false 3 3
Add-Text $slide 'Surplus-to-' 48 116 560 64 43 $serif $ink $true $false 1 1
Add-Text $slide 'Shelter' 48 174 560 70 49 $serif $rust $true $true 1 1
Add-Text $slide 'Real-time algorithmic food rescue engine.' 48 273 535 28 16 $sans $ink $false $false 1 1
Add-Text $slide 'Solving the 2–6 hour spoilage bottleneck with live capacity-matching & automated ESG receipts.' 48 316 570 36 11.5 $sans $muted $false $true 1 1
Add-Line $slide 48 404 624 404 $line 0.75 $false
Add-Text $slide 'TEAM' 48 426 80 14 7.5 $mono $muted $true $false 1 1
Add-Text $slide 'TechCypher' 48 442 180 20 12 $sans $ink $true $false 1 1
Add-Text $slide 'DEPLOYMENT' 258 426 120 14 7.5 $mono $muted $true $false 1 1
Add-Text $slide 'Live Netlify Web App' 258 442 250 20 12 $sans $ink $true $false 1 1
Add-Text $slide 'URGENT' 750 78 160 20 9 $mono $rust $true $false 2 3
Add-Rect $slide 741 119 180 170 $forest -1 0 1
Add-Text $slide '2–6' 758 142 145 70 49 $sans $white $true $false 2 1
Add-Text $slide 'HOURS' 758 211 145 28 17 $mono $rust $true $false 2 1
Add-Text $slide 'SPOILAGE WINDOW' 750 304 160 16 7.5 $mono $white $true $false 2 3
Add-Circle $slide 765 397 12 $rust -1
Add-Line $slide 777 403 905 403 $rust 1.2 $true
Add-Circle $slide 893 397 12 $white $forest
Add-Text $slide 'SURPLUS' 746 423 95 14 7 $mono $white $true $false 1 3
Add-Text $slide 'SHELTER' 850 423 100 14 7 $mono $white $true $false 3 3
$tag = Add-RoundedRect $slide 803 344 96 57 $rust -1
$tag.Rotation = -8
Add-Text $slide 'LATE' 815 362 70 20 10 $mono $white $true $false 2 3
Add-Text $slide '01 / 06' 837 514 89 14 7.5 $mono $forest $true $false 3 3

# Slide 2 — Root problem
$slide = $pres.Slides.Add(2, 12)
Set-SlideBackground $slide $cream
Add-Kicker $slide 'ANATOMY  /  OF A FAILING HANDOFF' 'THREE BOTTLENECKS  /  ONE SUPPLY CHAIN'
Add-Text $slide 'Why good cooked food ' 34 70 470 50 26 $serif $ink $true $false 1 1
Add-Text $slide 'still' 504 70 74 50 26 $serif $rust $true $true 1 1
Add-Text $slide ' becomes waste.' 576 70 300 50 26 $serif $ink $true $false 1 1
Add-Text $slide 'The missing ingredient is not supply, capacity, or goodwill. It is a clock that beats faster than WhatsApp, a gate we cannot see, and a margin that points the wrong way.' 34 129 870 27 9.5 $sans $muted $false $false 1 1
$colX = @(34, 344, 654)
$titles = @('The spoilage window.', 'The capacity blind spot.', 'Cost goes the wrong way.')
$bodies = @(
    "Cooked food decays faster than manual coordination can run. WhatsApp forwards lose the thread. Calls die on hold. By the time a driver would arrive, the tawa is cold.",
    "Shelters have free cold-storage slots we never see. A 30kg delivery to a shelter with 8kg of room is a re-dump an hour later, at the next chowk.",
    "The dustbin is one tap away. Donating is twenty-five. No automated receipt, no 80G paper trail, no finance committee recognition. The trolley rolls past the donation shelf."
)
$metrics = @('2–6', '0', '₹0')
$units = @('H', '/n', '/kg')
$metricColors = @($ink, $ink, $rust)
for ($i = 0; $i -lt 3; $i++) {
    $x = $colX[$i]
    Add-Line $slide $x 178 ($x + 268) 178 $rust 2 $false
    Add-Text $slide ('0' + ($i + 1) + '  /  03') $x 188 120 14 7.5 $mono $rust $true $false 1 1
    Add-Metric $slide $metrics[$i] $units[$i] $x 218 235 $metricColors[$i]
    Add-Text $slide $titles[$i] $x 279 260 24 13.5 $sans $ink $true $false 1 1
    Add-Text $slide $bodies[$i] $x 321 270 96 9 $sans $muted $false $false 1 1
}
Add-Rect $slide 34 443 892 29 $rust -1
Add-Text $slide 'The gap is not distance. It is a missing 30-second data bridge.' 55 448 850 20 14 $serif $white $true $true 1 3
Add-Source $slide 'Context / UNEP Food Waste Index 2024: 1.05B tonnes wasted globally in 2022 · 132 kg per capita · ~1/5 of food available to consumers.'
Add-Footer $slide 'PROBLEM  /  ANATOMY OF A FAILING HANDOFF' 2

# Slide 3 — Web app
$slide = $pres.Slides.Add(3, 12)
Set-SlideBackground $slide $cream
Add-Kicker $slide 'PRODUCT  /  UNIFIED COMMAND CENTER' 'LIVE NETLIFY WEB APP  /  FIREBASE'
Add-SectionTitle $slide 'The web app turns a rescue into a live dispatch decision.' ''
Add-Image $slide $appShot 34 128 585 357
Add-Rect $slide 645 128 281 357 $paper $line 0 1
Add-Text $slide 'MVP FLOW' 665 148 120 14 8 $mono $rust $true $false 1 1
$featureRows = @(
    @('01 / INTAKE', '< 3 MIN', 'Food item, kg, expiry window'),
    @('02 / TRIAGE', '< 2 HRS', 'Urgent food flags in red'),
    @('03 / DISPATCH', '50 KG CAP', 'Capacity-aware route; status flips to DISPATCHED'),
    @('LIVE / DATA', 'LIVE SYNC', 'onSnapshot real-time sync without page reloads')
)
$fy = 178
foreach ($row in $featureRows) {
    Add-Line $slide 665 ($fy - 12) 906 ($fy - 12) $line 0.55 $false
    Add-Text $slide $row[0] 665 $fy 115 14 7.2 $mono $muted $true $false 1 1
    Add-Text $slide $row[1] 795 $fy 111 22 15 $serif $rust $true $false 3 1
    Add-Text $slide $row[2] 665 ($fy + 20) 241 30 8.5 $sans $ink $false $false 1 1
    $fy += 72
}
Add-Rect $slide 34 503 892 1 $line -1
Add-Text $slide 'BUILT WITH VANILLA HTML  ·  TAILWIND CDN  ·  FIREBASE FIRESTORE V10  ·  LOCAL FALLBACK READY' 34 487 892 15 7 $mono $muted $true $false 1 3
Add-Footer $slide 'PRODUCT  /  INTAKE → TRIAGE → DISPATCH' 3

# Slide 4 — Solution
$slide = $pres.Slides.Add(4, 12)
Set-SlideBackground $slide $forest
Add-Kicker $slide 'CORE SOLUTION  /  PIPELINE' 'ONE EVENT  /  ONE STATE  /  ONE LIVE BOARD'
Add-Text $slide 'A pipeline that ' 34 70 420 48 26 $serif $paper $true $false 1 1
Add-Text $slide 'beats biological decay.' 436 70 440 48 26 $serif $rust $true $true 1 1
Add-Text $slide 'The product turns a donor handoff into a timed, capacity-aware decision.' 34 129 760 22 10 $sans $muted $false $false 1 1
$nodes = @('DONOR INTAKE', 'EXPIRY TRIAGE', 'CAPACITY MATCH', 'DRIVER DISPATCH')
$nx = @(34, 255, 476, 697)
for ($i = 0; $i -lt $nodes.Length; $i++) {
    Add-Rect $slide $nx[$i] 177 190 29 ($paper - $forestDeep) $forest 0 5
    Add-Text $slide $nodes[$i] ($nx[$i] + 9) 185 172 12 7.4 $mono $forest $true $false 2 3
    if ($i -lt 3) { Add-Line $slide ($nx[$i] + 190) 191 ($nx[$i] + 219) 191 $rust 1.2 $true }
}
$solutionX = @(34, 344, 654)
$solutionMetrics = @('< 3 MIN', '< 2 HRS', '50 KG CAP')
$solutionTitles = @('Frictionless donor intake form.', 'Expiry triage engine flags urgent food in red.', 'Capacity-aware dispatch prevents secondary dumping.')
$solutionDetails = @('A 1-minute intake captures food item, quantity, and expiry window.', 'The 2–6 hour spoilage window becomes a red, time-stamped decision lane.', 'The cap keeps one shelter from receiving a bag it cannot safely store.')
for ($i = 0; $i -lt 3; $i++) {
    $x = $solutionX[$i]
    Add-Rect $slide $x 232 268 143 ($paper) $rust 0 1
    Add-Text $slide ('0' + ($i + 1) + '  /  FEATURE') ($x + 15) 248 140 14 7.3 $mono $rust $true $false 1 1
    Add-Text $slide $solutionMetrics[$i] ($x + 15) 273 235 32 23 $serif $forest $true $false 1 1
    Add-Text $slide $solutionTitles[$i] ($x + 15) 317 235 35 10.2 $sans $ink $true $false 1 1
    Add-Text $slide $solutionDetails[$i] ($x + 15) 354 235 16 7.5 $sans $muted $false $false 1 1
}
Add-Text $slide 'FAILURE HANDLING' 34 405 180 14 7.5 $mono $rust $true $false 1 1
$riskX = @(34, 344, 654)
$riskTitles = @('Spoilage Cut-off', 'Capacity Triage', '0-Lag Architecture')
$riskBodies = @('Auto-cancel dispatch if shelf-life drops under 45 mins. Zero liability.', 'Dynamic routing cascades to the next NGO if the 50kg limit is hit.', 'Firebase real-time sync without page reloads.')
for ($i = 0; $i -lt 3; $i++) {
    Add-Rect $slide $riskX[$i] 428 268 54 $forestDeep ($rust) 0 1
    Add-Text $slide $riskTitles[$i] ($riskX[$i] + 13) 438 242 15 9.4 $sans $paper $true $false 1 1
    Add-Text $slide $riskBodies[$i] ($riskX[$i] + 13) 458 242 18 7.2 $sans $muted $false $false 1 1
}
Add-Footer $slide 'SOLUTION  /  PIPELINE THAT BEATS DECAY' 4

# Slide 5 — Business model / impact
$slide = $pres.Slides.Add(5, 12)
Set-SlideBackground $slide $paper
Add-Kicker $slide 'IMPACT  /  BUSINESS MODEL IN ONE SLIDE' 'ESG  /  SEC 80G  /  CSR'
Add-Text $slide 'A live ' 34 70 150 48 26 $serif $ink $true $false 1 1
Add-Text $slide 'Sec 80G' 184 70 150 48 26 $serif $forest $true $true 1 1
Add-Text $slide ' certificate, printed on' 334 70 480 48 26 $serif $ink $true $false 1 1
Add-Text $slide 'every rescue.' 34 116 400 48 26 $serif $rust $true $true 1 1
Add-Text $slide 'Every kilogram that flows through the system produces an auditable handoff — and three real numbers the finance team can write into the next CSR return.' 34 166 830 26 9.5 $sans $muted $false $false 1 1
Add-Rect $slide 34 210 278 203 $cream $line 0 1
Add-Text $slide 'THE COMPUTATION  /  PER KILOGRAM RESCUED' 49 229 245 14 7.2 $mono $rust $true $false 1 1
Add-Text $slide 'Meals = Qty × 3' 49 261 235 24 16 $mono $forest $true $false 1 1
Add-Text $slide 'CO₂e = Qty × 2.5 kg' 49 309 235 24 14 $mono $forest $true $false 1 1
Add-Text $slide 'Tax value = Qty × ₹20' 49 357 235 24 14 $mono $forest $true $false 1 1
Add-Rect $slide 327 210 278 203 $forestDeep $forestDeep 0 1
Add-Text $slide 'WORKED EXAMPLE  /  10 KG RESCUE' 342 229 245 14 7.2 $mono $rust $true $false 1 1
Add-Text $slide '30' 342 258 90 43 29 $serif $paper $true $false 1 1
Add-Text $slide 'meals' 421 274 90 15 8 $mono $muted $true $false 1 1
Add-Text $slide '25 kg' 342 309 100 35 22 $serif $paper $true $false 1 1
Add-Text $slide 'CO₂e diverted' 421 319 135 15 8 $mono $muted $true $false 1 1
Add-Text $slide '₹200' 342 360 120 35 23 $serif $amber $true $false 1 1
Add-Text $slide 'impact value' 421 369 110 15 8 $mono $muted $true $false 1 1
Add-Rect $slide 620 210 306 203 $cream $line 0 1
Add-Text $slide 'IMMUTABLE AUDIT TRAIL' 635 229 275 14 7.2 $mono $rust $true $false 1 1
Add-Text $slide '01' 635 264 42 26 20 $mono $forest $true $false 1 1
Add-Text $slide 'Posted' 635 292 90 14 8 $sans $ink $true $false 1 1
Add-Line $slide 681 278 730 278 $rust 1.1 $true
Add-Text $slide '02' 738 264 42 26 20 $mono $forest $true $false 1 1
Add-Text $slide 'Matched' 738 292 90 14 8 $sans $ink $true $false 1 1
Add-Line $slide 788 278 837 278 $rust 1.1 $true
Add-Text $slide '03' 845 264 42 26 20 $mono $forest $true $false 1 1
Add-Text $slide 'Dispatched' 845 292 72 30 8 $sans $ink $true $false 1 1
Add-Line $slide 635 332 909 332 $line 0.55 $false
Add-Text $slide 'Each handoff is time-stamped and linked. The 80G certificate is generated from the same audit trail.' 635 347 270 45 8.2 $sans $muted $false $false 1 1
Add-Rect $slide 34 435 892 39 $rust $rust 0 1
Add-Text $slide '80G NOTE  /  ₹20 per kg is a configurable impact-value proxy. Actual deduction depends on the qualifying donation and recipient status.' 49 445 860 18 8.2 $sans $white $true $false 1 3
Add-Source $slide 'Tax reference / Income Tax Department, Section 80G deduction guidance. Product note / the ₹20/kg value is a declared impact proxy, not a statutory tax rate.'
Add-Footer $slide 'IMPACT  /  EVERY RESCUE BECOMES A RECEIPT' 5

# Slide 6 — Scale / flywheel / pilot
$slide = $pres.Slides.Add(6, 12)
Set-SlideBackground $slide $cream
Add-Kicker $slide 'SCALE  /  TWO LOOPS, ONE FLYWHEEL' 'PILOT SCORECARD  /  NEXT 30 DAYS'
Add-Text $slide 'From a Jaipur pilot to a ' 34 70 500 48 26 $serif $ink $true $false 1 1
Add-Text $slide 'repeatable rescue network.' 510 70 390 48 26 $serif $rust $true $true 1 1
Add-Text $slide 'The product earns its place when both sides of the handoff get something measurable.' 34 129 720 22 10 $sans $muted $false $false 1 1
Add-Rect $slide 34 183 242 178 $forest $forest 0 1
Add-Text $slide 'RESTAURANTS / KITCHENS' 51 202 205 14 7.2 $mono $rust $true $false 1 1
Add-Text $slide 'Donating becomes a 20-five tap process, not a twenty-five call.' 51 231 205 50 13 $serif $white $true $false 1 1
Add-Text $slide 'Auto-issued ESG receipts give finance teams a clean CSR attachment and a reason to repeat the behavior.' 51 305 205 40 8.4 $sans $muted $false $false 1 1
Add-Rect $slide 298 183 242 178 $paper $line 0 1
Add-Text $slide 'SHELTERS / NGOS' 315 202 205 14 7.2 $mono $rust $true $false 1 1
Add-Text $slide 'Predictable inflow beats dropped bags at odd hours.' 315 231 205 50 13 $serif $forest $true $false 1 1
Add-Text $slide 'Menu planning becomes predictable; every delivery is time-stamped and linked to a safe handoff.' 315 305 205 40 8.4 $sans $muted $false $false 1 1
Add-Rect $slide 568 183 358 178 $forestDeep $forestDeep 0 1
Add-Text $slide 'THE FLYWHEEL' 585 202 320 14 7.2 $mono $rust $true $false 1 1
$fly = @(@(615,265,'SURPLUS',$rust), @(742,243,'LIVE DATA',$paper), @(842,292,'MATCH',$amber), @(742,341,'MEAL',$paper), @(615,316,'AUDIT',$paper))
foreach ($f in $fly) { Add-Circle $slide $f[0] $f[1] 47 $f[3] -1 0.8; Add-Text $slide $f[2] $f[0] ($f[1] + 17) 47 14 6.8 $mono $(if ($f[3] -eq $rust) { $white } else { $forest }) $true $false 2 3 }
Add-Line $slide 662 277 698 265 $rust 1.2 $true
Add-Line $slide 787 255 818 284 $rust 1.2 $true
Add-Line $slide 835 335 782 345 $rust 1.2 $true
Add-Line $slide 708 331 665 310 $rust 1.2 $true
Add-Line $slide 631 282 639 312 $rust 1.2 $true
Add-Rect $slide 34 391 892 76 $paper $line 0 1
Add-Text $slide '30-DAY PILOT TARGETS' 51 408 170 14 7.2 $mono $rust $true $false 1 1
$targets = @('≤ 3 MIN  /  intake', '< 2 HRS  /  urgent response', '0  /  dropped bags', '100%  /  logged handoffs')
$tx = @(230, 395, 560, 720)
for ($i = 0; $i -lt 4; $i++) { Add-Text $slide $targets[$i] $tx[$i] 413 150 18 10.5 $mono $forest $true $false 1 1 }
Add-Text $slide 'Pilot success = a measurable reduction in spoilage, a reliable NGO handoff, and a CSR-ready record for every kilogram.' 51 444 820 18 8.5 $sans $muted $false $true 1 1
Add-Source $slide 'Context / UNEP Food Waste Index 2024  ·  Product / Firebase Firestore real-time listeners  ·  Tax / Income Tax Department Section 80G  ·  Safety / FSSAI verification is a deployment requirement.'
Add-Footer $slide 'SCALE  /  MAKE THE RIGHT HANDOFF THE EASY HANDOFF' 6

# Save
if (Test-Path $out) { Remove-Item -LiteralPath $out -Force }
if (Test-Path $pdf) { Remove-Item -LiteralPath $pdf -Force }
$pres.SaveAs($out, 24)
$pres.SaveAs($pdf, 32)
$pres.Close()
$ppt.Quit()
[System.Runtime.Interopservices.Marshal]::ReleaseComObject($pres) | Out-Null
[System.Runtime.Interopservices.Marshal]::ReleaseComObject($ppt) | Out-Null
[GC]::Collect()
[GC]::WaitForPendingFinalizers()
Write-Output "Created $out"
Write-Output "Created $pdf"

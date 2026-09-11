# Fills in sitemap.xml, robots.txt and feed.xml for whatever domain you host the site on.
$d = Read-Host 'Your site address (e.g. https://www.example.com)'
$d = $d.Trim().TrimEnd('/')
if ($d -notmatch '^https?://') { $d = 'https://' + $d }
$host1 = ([uri]$d).Host -replace '^www\.',''
$root = $PSScriptRoot
foreach ($f in 'sitemap.xml','robots.txt','feed.xml') {
  $t = Get-Content -Raw -Encoding UTF8 (Join-Path $root "_feeds\$f.tmpl")
  $t = $t.Replace('{{SITE}}', $d).Replace('{{EMAIL}}', "newsroom@$host1")
  [IO.File]::WriteAllText((Join-Path $root $f), $t, (New-Object System.Text.UTF8Encoding $false))
  Write-Host "wrote $f"
}
Write-Host 'Done. Submit sitemap.xml in Google Search Console.'

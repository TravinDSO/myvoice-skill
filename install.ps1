# Install the myvoice skill.
# Usage: .\install.ps1 [claude|codex|agents|all]
param([ValidateSet('claude','codex','agents','all')][string]$Target = 'all')

$ErrorActionPreference = 'Stop'
$src = Join-Path $PSScriptRoot 'myvoice'
if (-not (Test-Path (Join-Path $src 'SKILL.md'))) { throw "SKILL.md not found in $src" }

function Install-To([string]$root) {
  $dest = Join-Path $root 'myvoice'
  New-Item -ItemType Directory -Force -Path $root | Out-Null
  if (Test-Path $dest) { Remove-Item -Recurse -Force $dest }
  Copy-Item -Recurse $src $dest
  Write-Output "installed -> $dest"
}

switch ($Target) {
  'claude' { Install-To "$HOME\.claude\skills" }
  'codex'  { Install-To "$HOME\.codex\skills" }
  'agents' { Install-To "$HOME\.agents\skills" }
  'all'    { Install-To "$HOME\.claude\skills"; Install-To "$HOME\.codex\skills" }
}

Write-Output "Done. Restart your agent, then type /myvoice"

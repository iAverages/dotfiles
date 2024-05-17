# Prompt
Import-Module posh-git
$omp_config = Join-Path $PSScriptRoot ".\dan.omp.json"
oh-my-posh --init --shell pwsh --config $omp_config | Invoke-Expression

# Alias 
Set-Alias vim nvim
Set-Alias ll ls
Set-Alias less 'C:\Program Files\Git\usr\bin\less.exe'

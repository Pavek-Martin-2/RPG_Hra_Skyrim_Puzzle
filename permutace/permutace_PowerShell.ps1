cls

# funkce permutace

[int64] $poc = 1
$pole_output = @()

$raw = Read-Host "zadej nazvy oddelene mezerou a ukonci klavesou [Enter]"
$keys = $raw.Split(" ", [System.StringSplitOptions]::RemoveEmptyEntries) # dobrej radek

function Get-Permutations {
    param([string[]]$items, [string]$prefix = '')
    if ($items.Count -eq 0) {
        $prefix
    } else {
        for ($i = 0; $i -lt $items.Count; $i++) {
            $current = $items[$i]
            $remaining = $items | Where-Object { $_ -ne $current }
            Get-Permutations -items $remaining -prefix ($prefix + $current + ' ')
        }
    }
}

$all = Get-Permutations -items $keys
$d_all = $($all.Count)

for ( $aa = 0; $aa -le $d_all-1; $aa++ ) {
$out_1 = ""
$out_1 += [string]$poc
$out_1 += " - "
$out_1 += [string] $all[$aa]
echo $out_1
$pole_output += $out_1
$poc++
}

$file = "permutace_PowerShell.txt"
# smazani stareho souboru
Remove-Item -Path $file -ErrorAction SilentlyContinue
sleep 1

# ulozeni do souboru
Set-Content -Path $file -Encoding ASCII -Value $pole_output
write-host -ForegroundColor Yellow -NoNewline "ulozeno do souboru "
write-host -ForegroundColor Cyan $file
sleep 10

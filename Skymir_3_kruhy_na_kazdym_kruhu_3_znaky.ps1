cls

<#
   PoweShell verze
   RPG hra na Xbox Skyrim, reseni pro otevreni kulatejch dveri
   3 kruhy a na kazdym 3 znaky, vsechny kombinace
#>


# obsah vsech 3 kruhu je stejny, tzn. ze staci jen jedno pole
$symboly_na_kruhach = @(
"mura",
"sova",
"medved"
)


$delka_pole_symboly_na_kruhach = $symboly_na_kruhach.Length
#echo $delka_pole_symboly_na_kruhach

$pole_output = @()
$kombinace = 1

$hlaska_1 = " 3 kruhy a na kazdy kruhu 3 symboly"
$hlaska_2 = "     nejvetsi stredni najmensi"
echo $hlaska_1
echo $hlaska_2

$pole_output += $hlaska_1
$pole_output += $hlaska_2


for ( $velky_kruh = 0; $velky_kruh -lt $delka_pole_symboly_na_kruhach; $velky_kruh ++ ){ # -lt <
for ( $sterdni_kruh = 0; $sterdni_kruh -lt $delka_pole_symboly_na_kruhach; $sterdni_kruh ++ ){
for ( $maly_kruh = 0; $maly_kruh -lt $delka_pole_symboly_na_kruhach; $maly_kruh ++ ) {
                                     
if ( $kombinace -lt 10 ) {
$out = "0" + [string] $kombinace
}else{
$out = [string] $kombinace
}

$out += " -   "
$out += $symboly_na_kruhach[$velky_kruh]
$out += "     "
$out += $symboly_na_kruhach[$sterdni_kruh]
$out += "     "
$out += $symboly_na_kruhach[$maly_kruh]
echo $out
$pole_output += $out

#echo "$poc - $kruh_nejvetsi[$aa] $kruh_prostredni[$bb] $kruh_nejmensi[$cc]"
$kombinace++
}
}
}


$file_name = "Skymir_3_kruhy_a_na_kazdym_3_znaky.txt"
Set-Content -Path $file_name -Encoding ASCII -Value $pole_output
sleep 1

# pause
Read-Host -Prompt "Press ENTER to exit"

      
cls

<#
   PoweShell verze
   RPG hra na Xbox Skyrim, reseni pro otevreni kulatejch dveri
   3 kruhy a na kazdym 3 znaky, vsechny kombinace
#>

Set-PSDebug -Strict # jakakoliv nedeklarovana promenna pri jejim zavolani udela chybu skriptu

# obsah vsech 3 kruhu je stejny, tzn. ze staci jen jedno pole
$symboly_na_kamenech = @(
" had",
"ryba",
"orel"
)


$delka_pole_symboly_na_kamenech = $symboly_na_kamenech.Length
#echo $delka_pole_symboly_na_kamenech

$pole_output = @()
$kombinace = 1

$hlaska_1 = " 4 kameny a na kazdy jsou 3 symboly"
$hlaska_2 = "        k1      k2      k3      k4"
echo $hlaska_1
echo $hlaska_2

$pole_output += $hlaska_1
$pole_output += $hlaska_2


for ( $kamen_jedna = 0; $kamen_jedna -lt $delka_pole_symboly_na_kamenech ; $kamen_jedna ++ ){ # -lt <
for ( $kamen_dve = 0; $kamen_dve -lt $delka_pole_symboly_na_kamenech ; $kamen_dve ++ ) {
for ( $kamen_tri = 0; $kamen_tri -lt $delka_pole_symboly_na_kamenech ; $kamen_tri ++ ) {
for ( $kamen_ctyri = 0; $kamen_ctyri-lt $delka_pole_symboly_na_kamenech ; $kamen_ctyri ++ ) {
                                     
if ( $kombinace -lt 10 ) {
$out = "0" + [string] $kombinace
}else{
$out = [string] $kombinace
}

$out += " -  "
$out += $symboly_na_kamenech[$kamen_jedna]
$out += "    "
$out += $symboly_na_kamenech[$kamen_dve]
$out += "    "
$out += $symboly_na_kamenech[$kamen_tri]
$out += "    "
$out += $symboly_na_kamenech[$kamen_ctyri]


echo $out
$pole_output += $out

#echo "$poc - $kruh_nejvetsi[$aa] $kruh_prostredni[$bb] $kruh_nejmensi[$cc]"
$kombinace++
}
}
}
}


$file_name = "Skymir_4_kameny_na_kazdym_3_symboly.txt"
Set-Content -Path $file_name -Encoding ASCII -Value $pole_output
sleep 1

# pause
Read-Host -Prompt "Press ENTER to exit"

      
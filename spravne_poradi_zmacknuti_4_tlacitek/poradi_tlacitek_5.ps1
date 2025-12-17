cls

# Skyrim, 4 paky spravne poradi zmacknuti, vsechny moznosti
# jsou 4 paky napr. paka1, paka2, paka3, paka4
# a za ty se musi zatahnou ve spravnym poradi a za kazdou paku jenom jednou a za vsechny 4

$poc = 1

$pole_out = @()

$pole_znaky_paky = @(
" had ", # 0
" lyska ", # 1
" medved ", # 2
" vlk " # 3
)

$moznosti = @(
# musi obsahovat jenom cislice 1,2,3,4 a zadny v polozce se nesmi opakovat 2x stejny, kazda paka bude aktivovana jen jednou
# jak tohle to automaticky vygenerovat aby se to nemuselo psat rucne ? ( potom muze bejt taky treba 5 pacek apod.)
1234, # minimum
1243, # a kazdej novej radek vzdycky nejblizzsi vyssi cislo z obsahem cislic  1,2,3,4 a bez opakovani cislic na radku
1324, # cyklus od 1234 do 4321 a vyhazet co nevyhovuje podminkam a zpracovat jen co vyhovuje a melo by vzniknout tohle
1342, # a udelat to univerzalni pro vsechny rozsahy
1423,
1432,
2134,
2143,
2314,
2341,
2413,
2431,
3124,
3142,
3214,
3241,
3412,
3421,
4123,
4132,
4213,
4231,
4312,
4321 # mamimum
)

$d_moznosti = $moznosti.Length

for ( $aa = 0; $aa -le $d_moznosti-1; $aa++ ){                    
#echo $moznosti[$aa]

[int] $klic_1 = (($moznosti[$aa] / 1000)) # musi se mu rict [int] jinak stoho udela desetiny cislo
#echo $klic_1

[int] $klic_2 = (($moznosti[$aa] - $klic_1 * 1000 ) / 100) # [int] orizne desetinou cast typu Double
#echo $klic_2

[int] $klic_3 = (($moznosti[$aa] - $klic_1 * 1000 - $klic_2 * 100) / 10)
#echo $klic_3

[int] $klic_4 = (($moznosti[$aa] - $klic_1 * 1000 - $klic_2 * 100 - $klic_3 * 10))
#echo $klic_4


if ( $poc -lt 10 ) {
$radek = "0" + [string] $poc
}else{
$radek = [string] $poc
}

$radek += " -"

$radek += $pole_znaky_paky[$klic_1 -1] # pole ma prvni index[0]
$radek += $pole_znaky_paky[$klic_2 -1]
$radek += $pole_znaky_paky[$klic_3 -1]
$radek += $pole_znaky_paky[$klic_4 -1]

echo $radek
$pole_out += $radek
$poc++
}

$file_name = "Skyrim_4_tlacitka_spravny_poradi.txt"
Set-Content -Path $file_name -Encoding ASCII -Value $pole_out
echo ""
echo $file_name

sleep 10


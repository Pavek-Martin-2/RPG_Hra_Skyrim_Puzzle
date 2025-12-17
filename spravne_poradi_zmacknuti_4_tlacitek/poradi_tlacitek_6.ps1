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

for ( $aa = 1234; $aa -le 4321; $aa++ ) { # minimum az maximum

[string] $str = $aa

[int] $num_1 = $str.Substring(0,1)
#echo $num_1

[int] $num_2 = $str.Substring(1,1)
#echo $num_2

[int] $num_3 = $str.Substring(2,1)
#echo $num_3

[int] $num_4 = $str.Substring(3,1)
#echo $num_4

#echo "$num_1 $num_2 $num_3 $num_4"


# podminky
$kontrola = 0

# rozsah cisla 1-4
if (( $num_2 -ge 1  ) -and ( $num_2 -le 4 )) { $kontrola++ }
if (( $num_3 -ge 1  ) -and ( $num_3 -le 4 )) { $kontrola++ }
if (( $num_4 -ge 1  ) -and ( $num_4 -le 4 )) { $kontrola++ }                               

# porvnani na duplicity
if ( $num_1 -ne $num_2 ){ $kontrola++ }
if ( $num_1 -ne $num_3 ){ $kontrola++ }
if ( $num_1 -ne $num_4 ){ $kontrola++ }
if ( $num_2 -ne $num_3 ){ $kontrola++ }
if ( $num_2 -ne $num_4 ){ $kontrola++ }
if ( $num_3 -ne $num_4 ){ $kontrola++ }

# vezme cislo pouze kdyz $kontrola = 9 
if ($kontrola -eq 9 ){
#echo $kontrola
echo $aa

if ( $poc -lt 10 ) {
$radek = "0" + [string] $poc
}else{
$radek = [string] $poc
}

$radek += " -"
$radek += $pole_znaky_paky[$num_1 -1] # pole ma prvni index[0]
$radek += $pole_znaky_paky[$num_2 -1]
$radek += $pole_znaky_paky[$num_3 -1]
$radek += $pole_znaky_paky[$num_4 -1]
echo $radek
$pole_out += $radek
$poc++
}
}

$file_name = "Skyrim_4_tlacitka_spravny_poradi.txt"
Set-Content -Path $file_name -Encoding ASCII -Value $pole_out
echo ""
echo $file_name

sleep 10


cls

# ve hre sem sice 6 tlacitek nikde nevidel ale i tak me zajimalo jake by to melo vysledek :)
# autori by to tam asi ani nedali z pochopitelnejch duvodu

$poc = 1
$pole_out = @()

$pole_znaky_paky = @(
" had ", # 0
" lyska ", # 1
" medved ", # 2
" vlk ", # 3
" beran ", # 4
" kocka " # 5
)

for ( $aa = 123456; $aa -le 654321; $aa++ ) { # minimum az maximum
# $max = [int32]::MaxValue ; echo $max ; echo $max.GetType()  # 2147483647
# nove vytvorena celociselna promenna je automaticky type [int32] v PowerShellu jako default
# kdybyste chteli setrit pamet aby nebyla zbytecne nekde alokovana a pak nevyuzita, tak mu to musite rict napr. [int16] $aa =
[string] $str = $aa

[int] $num_1 = $str.Substring(0,1)
#echo $num_1
[int] $num_2 = $str.Substring(1,1)
#echo $num_2
[int] $num_3 = $str.Substring(2,1)
#echo $num_3
[int] $num_4 = $str.Substring(3,1)
#echo $num_4
[int] $num_5 = $str.Substring(4,1)
#echo $num_5
[int] $num_6 = $str.Substring(5,1)
#echo $num_6

#echo "$num_1 $num_2 $num_3 $num_4 $num_5 $num_6"

# podminky
$kontrola = 0

# rozsah cisla 1-5
if (( $num_2 -ge 1  ) -and ( $num_2 -le 6 )) { $kontrola++ }
if (( $num_3 -ge 1  ) -and ( $num_3 -le 6 )) { $kontrola++ }
if (( $num_4 -ge 1  ) -and ( $num_4 -le 6 )) { $kontrola++ }                               
if (( $num_5 -ge 1  ) -and ( $num_5 -le 6 )) { $kontrola++ } 
if (( $num_6 -ge 1  ) -and ( $num_6 -le 6 )) { $kontrola++ } # 5 

<#
1-2 
1-3 
1-4 
1-5
1-6

2-3
2-4
2-5
2-6

3-4
3-5
3-6

4-5
4-6

5-6

#>

# porvnani na duplicity
if ( $num_1 -ne $num_2 ){ $kontrola++ }
if ( $num_1 -ne $num_3 ){ $kontrola++ }
if ( $num_1 -ne $num_4 ){ $kontrola++ }
if ( $num_1 -ne $num_5 ){ $kontrola++ }
if ( $num_1 -ne $num_6 ){ $kontrola++ } # 10

if ( $num_2 -ne $num_3 ){ $kontrola++ }
if ( $num_2 -ne $num_4 ){ $kontrola++ }
if ( $num_2 -ne $num_5 ){ $kontrola++ }
if ( $num_2 -ne $num_6 ){ $kontrola++ } # 14

if ( $num_3 -ne $num_4 ){ $kontrola++ }
if ( $num_3 -ne $num_5 ){ $kontrola++ }
if ( $num_3 -ne $num_6 ){ $kontrola++ } # 17

if ( $num_4 -ne $num_5 ){ $kontrola++ }
if ( $num_4 -ne $num_6 ){ $kontrola++ }

if ( $num_5 -ne $num_6 ){ $kontrola++ } # 20

# vezme cislo pouze kdyz $kontrola = 20
if ($kontrola -eq 20 ){
#echo $kontrola
echo $aa


if ( $poc -lt 10 ){ # -10 
$radek = "00" + [string] $poc
}elseif (( $poc -gt 9 ) -and ( $poc -lt 100)){ # > 9 -and < 100
$radek = "0" + [string] $poc
}else{
$radek = [string] $poc # > 100
}

$radek += " -"
$radek += $pole_znaky_paky[$num_1 -1] # pole ma prvni index[0]
$radek += $pole_znaky_paky[$num_2 -1]
$radek += $pole_znaky_paky[$num_3 -1]
$radek += $pole_znaky_paky[$num_4 -1]
$radek += $pole_znaky_paky[$num_5 -1]
$radek += $pole_znaky_paky[$num_6 -1]
echo $radek
$pole_out += $radek
$poc++
}
}

$file_name = "Skyrim_6_tlacitek_spravny_poradi.txt"
Set-Content -Path $file_name -Encoding ASCII -Value $pole_out
echo ""
echo $file_name

sleep 30


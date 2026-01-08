#include <iostream>
#include <vector>
#include <algorithm> // sort(); next_permutation()
#include <fstream>
using namespace std;

// Skyrim volitelne pocet tlacitek a volitelne ktomu taky nazvy techto tlacitek

int aa, bb, cc, pocet_tlacitek, poc = 1; // pozor na int poc
string zadani;
string soubor = "permutace_knihovna_algorithm_Cpp.txt";

int main(){
cout<<"C++ permutace pomoci knihovny <algorithm>"<<endl;
cout<<"zadej libovolny pocet nazvu oddelenych vzajemne mezerou a jako posledni napis konec"<<endl;
vector<string> pole_zadavani;

do{
cin>>zadani;
pole_zadavani.push_back(zadani);
}
while (zadani != "konec");

size_t d_pole_zadavani = pole_zadavani.size();
//cout<<d_pole_zadavani<<endl;

// prepsani do noveho pole_tlacitka, bez posledniho klice "konec"
vector<string> pole_tlacitka;
for (aa=0; aa<=d_pole_zadavani -2; aa++){
//cout<<d_pole_zadavani[aa]<<"-"<<endl;
pole_tlacitka.push_back(pole_zadavani[aa]);
}
size_t pocet_tlacitek = pole_tlacitka.size();
//cout<<pocet_tlacitek<<endl;

// seradime, aby next_permutation fungoval od prvni permutace
sort(pole_tlacitka.begin(), pole_tlacitka.end());

ofstream file(soubor);
if (!file) {
cerr<<"nelze otevrit soubor pro zapis\n";
system("pause");
return 1;
}

do{
// vypis na obrazovku
cout<<poc<<" - "; // tisk pocitadla
for (bb = 0; bb < pocet_tlacitek; bb++) {
cout<<pole_tlacitka[bb];
cout<<(bb + 1 < pocet_tlacitek ? " " : ""); // tiske radek kombinace
}
cout<<endl;

// ulozeni do souboru
file<<poc<<" - ";
for (cc = 0; cc < pocet_tlacitek; cc++) {
file<<pole_tlacitka[cc]<<(cc + 1 < pocet_tlacitek ? " " : "");
}
file<<endl;
poc++;
} while (next_permutation(pole_tlacitka.begin(), pole_tlacitka.end()));

poc--; // musi se zase jedna odecist, viz. kod
cout<<endl<<"celkem kombinaci "<<poc<<endl;
cout<<"ulozeno do souboru "<<'"'<<soubor<<'"'<<endl;

system("pause");
return 0;
}

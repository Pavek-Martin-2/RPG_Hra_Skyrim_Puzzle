#include <iostream>
#include <vector>
#include <fstream>

using namespace std;

/*
reseni pro RPG hry Skyrim, otevreni dvery ktere maji 4 kameny a na kazdem kameni jsou
3 symboly, vypise vsechny kombinace, vysledek je 3 ^ 4 = 81
uzivatelsky zadana volba tri znaku na kameni
*/

int main() {

// pole help
vector<string> help = {"had","ryba","ptak"};
vector<string> help_2 = {"prvni","druhy","treti"};
vector<string> help_3;

// uvodni hlaska
string file_name = "Skymir_4_kameny_na_kazdym_3_symboly_volba_znaku.txt";
string out, out_2;
string hlaska_1 = " 4 kameny a na kazdym kameni 3 symboly";
string hlaska_2 = "       k1      k2      k3     k4";
int kombinace = 1, kamen_1, kamen_2, kamen_3, kamen_4;
cout<<hlaska_1<<endl;

vector<string> symboly_na_kamenech;
// zadani tri symbolu na kameni (vsechny 4 kameny jsou stejny)
string zadani;
for (int aa = 1; aa <= 3; aa++){
cout<<"zadej "<<help_2[aa-1]<<" symbol na kameni napr. "<<help[aa-1]<<" ? ";
cin>>zadani;
// vlozeni string "zadani" na konec pole help_3
help_3.push_back(zadani);

// vlozeni zadani na konec prazdneho pole "symboly_na_kamenech"
symboly_na_kamenech.push_back(zadani);
}

cout<<endl<<"byly zadany 4 kameny ze symboly : ";
for (int bb = 0; bb < 3; bb++){
cout<<help_3[bb];
if (bb < 2 ) {
cout<<", ";	
}
}
cout<<endl;

// na stisk klavesy pokracovat (kontorola vstupu)
system("pause");

size_t d_symboly_na_kamenech = symboly_na_kamenech.size();
//cout<<d_symboly_na_kamenech<<endl;

// otevreni souboru pro zapis
ofstream vysledek(file_name);
if (!vysledek){
cout<<"chyba pri zapisu do souboru "<<'"'<<file_name<<'"'<<endl; // ReadOnly apod.
system("pause");
exit(1); // chybovej exit 1
}

cout<<hlaska_2<<endl;

// zapis hlasek do souboru
vysledek<<hlaska_1<<endl;
vysledek<<hlaska_2<<endl;

// pro 4 kameny, 3 vnoreny cykli
for (kamen_1 = 0; kamen_1 < d_symboly_na_kamenech; kamen_1++ ){
for (kamen_2 = 0; kamen_2 < d_symboly_na_kamenech; kamen_2++ ){
for (kamen_3 = 0; kamen_3 < d_symboly_na_kamenech; kamen_3++ ){
for (kamen_4 = 0; kamen_4 < d_symboly_na_kamenech; kamen_4++ ){
	
// pridava nulu na zacatek cisla kombinace < 10
out = to_string(kombinace);

if ( out.length() < 2 ){
out_2 = "0" + out; // do 99 
}else{
out_2 = out;	
}

out_2 += " -  ";
out_2 += symboly_na_kamenech[kamen_1];
out_2 += "     ";
out_2 += symboly_na_kamenech[kamen_2];
out_2 += "     ";
out_2 += symboly_na_kamenech[kamen_3];
out_2 += "     ";
out_2 += symboly_na_kamenech[kamen_4];
cout<<out_2<<endl;

// zapis do souboru vysledku
vysledek<<out_2<<endl;

kombinace++;

} // kamen_4
} // kamen_3
} // kamen_2
} // kamen_1

// uzavreni souboru vysledku
vysledek.close();
cout<<endl<<"toto bylo zapsano do souboru "<<'"'<<file_name<<'"'<<endl;

system("pause");
return 0;
}


#include <iostream>
#include <vector>
#include <fstream>

using namespace std;

/*
reseni pro RPG hru Skyrim, otevreni dvery ktere maji tri kruhy a na kazdem kruhu 3 symboly
vsechny 3 kruhy jsou vlastne stejne, jenom se vzajemne lisi velikosti
vypise vsechny kombinace, vysledek je 3 ^ 3 = 27
*/

int main(){	

vector<string> symboly_na_kruhach = {
"mura",
"sova",
"medved"
};

size_t d_symboly_na_kruhach = symboly_na_kruhach.size();
//cout<<d_symboly_na_kruhach<<endl;

string file_name = "Skymir_3_kruhy_a_na_kazdym_3_znaky.txt";
string out, out_2;
string hlaska_1 = " 3 kruhy a na kazdy kruhu 3 symboly";
string hlaska_2 = "     nejvetsi stredni najmensi";
int kombinace = 1, velky_kruh, sterdni_kruh, maly_kruh;


// otevreni souboru pro zapis
ofstream vysledek(file_name);
if (!vysledek){
cout<<"chyba pri zapisu do souboru "<<'"'<<file_name<<'"'<<endl; // ReadOnly apod.
system("pause");
exit(1); // chybovej exit 1
}

cout<<hlaska_1<<endl;
cout<<hlaska_2<<endl;

// zapis hlasek do souboru
vysledek<<hlaska_1<<endl;
vysledek<<hlaska_2<<endl;

// pro 3 kruhy, 3 vnoreny cykli
for (velky_kruh = 0; velky_kruh < d_symboly_na_kruhach; velky_kruh++ ){
for (sterdni_kruh = 0; sterdni_kruh < d_symboly_na_kruhach; sterdni_kruh++ ){
for (maly_kruh = 0; maly_kruh < d_symboly_na_kruhach; maly_kruh++ ){

// pridava nulu na zacatek cisla kombinace < 10
out = to_string(kombinace);

if ( out.length() < 2 ){
out_2 = "0" + out; // do 99 
}else{
out_2 = out;	
}

out_2 += " -   ";
out_2 += symboly_na_kruhach[velky_kruh];
out_2 += "     ";
out_2 += symboly_na_kruhach[sterdni_kruh];
out_2 += "     ";
out_2 += symboly_na_kruhach[maly_kruh];
cout<<out_2<<endl;

// zapis do souboru vysledku
vysledek<<out_2<<endl;

kombinace++;

} // maly_kruh
} // stredni
} // velky ( je to pozpatku, posledni se zavira prvni otevrenej cyklus )

// uzavreni souboru vysledku
vysledek.close();
cout<<endl<<"toto bylo zapsano do souboru "<<'"'<<file_name<<'"'<<endl;

system("pause");
return 0;
}



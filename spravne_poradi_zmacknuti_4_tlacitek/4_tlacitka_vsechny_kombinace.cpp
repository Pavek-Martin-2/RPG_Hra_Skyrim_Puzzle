#include <iostream>
#include <vector>
#include <fstream>

using namespace std;

// Skyrim 4 tlacitka, vsechny moznosti

int poc = 1;
int k = 0;
int aa, num_1, num_2, num_3, num_4;
string str, str_1, str_2, str_3, str_4;
string file_name = "Skyrim_4_tlacitka_spravny_poradi.txt";
string hlaska = "Skyrim 4 tlacitka vsechny kombinace";

int main(){	
// otevreni souboru pro zapis
ofstream file(file_name);
if (!file){
cout<<"chyba pri zapisu do souboru "<<'"'<<file_name<<'"'<<endl; // ReadOnly apod.
system("pause");
exit(1); // chybovej exit 1
}	

// zapise do souboru popis
cout<<hlaska<<endl<<endl;
file<<hlaska<<endl<<endl;

vector<string> packy = {
" had ",
" lyska ",
" medved ",
" vlk "
};

for (aa = 1234; aa <= 4321; aa++){
str = to_string(aa);
str_1 = str.substr (0,1);
str_2 = str.substr (1,1);
str_3 = str.substr (2,1);
str_4 = str.substr (3,1);

num_1 = stof(str_1); // prevadi string na int
num_2 = stof(str_2);
num_3 = stof(str_3);
num_4 = stof(str_4);

// podminky
k = 0; // vzdy vynulovani kontroly
if ( num_2 >= 1 && num_2 <= 4 ) { k++; }
if ( num_3 >= 1 && num_3 <= 4 ) { k++; }
if ( num_4 >= 1 && num_4 <= 4 ) { k++; } // k=3

// porvnani na duplicity
if ( num_1 != num_2 ){ k++; }
if ( num_1 != num_3 ){ k++; }
if ( num_1 != num_4 ){ k++; }
if ( num_2 != num_3 ){ k++; }
if ( num_2 != num_4 ){ k++; }
if ( num_3 != num_4 ){ k++; } // k=9

// vezme cislo pouze kdyz $kontrola = 9 
if (k == 9 ){

// pro 01-10
if ( poc < 10 ){
cout<<"0";
file<<"0"; // FileWrite
}

cout<<poc<<" - "<<packy[num_1 -1];
file<<poc<<" - "<<packy[num_1 -1];

cout<<packy[num_2 -1];
file<<packy[num_2 -1];

cout<<packy[num_3 -1];
file<<packy[num_3 -1];

cout<<packy[num_4 -1]<<endl;
file<<packy[num_4 -1]<<endl;

poc++;
}

}

// uzavreni souboru vysledku
file.close();
cout<<endl<<"toto bylo zapsano do souboru "<<'"'<<file_name<<'"'<<endl;

system("pause");
return 0;
}


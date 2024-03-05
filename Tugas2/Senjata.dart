import 'dart:io';

class Senjata {
  String nama;
  int kekuatan;

  Senjata(this.nama, this.kekuatan);

  String getNama() {
      return nama;
  }

  int getKekuatanSerang() {
      return kekuatan * 2;
  }
}

//void main() {
// Senjata pistol = Senjata("pistol", 30);
//  print(pistol.getNama());
//  print(pistol.getKekuatanSerang());
//}
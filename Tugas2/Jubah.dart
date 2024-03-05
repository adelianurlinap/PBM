import 'dart:io';

class Jubah {
    String nama;
    int kekuatan;
    int kesehatan;

    Jubah(this.nama, this.kekuatan, this.kesehatan);

    String getNama() {
        return nama;
    }

    int getTambahKesehatan() {
        return kesehatan * 10;
    }

    int getNilaiKekuatan() {
        return kekuatan * 2;
    }
}

//void main() {
//  Jubah jubahh = Jubah("adel", 10, 30);
//  print(jubahh.getNama());
//  print(jubahh.getTambahKesehatan());
//  print(jubahh.getNilaiKekuatan());
//}
import 'dart:io';
import 'Jagoan.dart';
import 'Jubah.dart';
import 'Senjata.dart';

void main() {
  Jagoan pitung = Jagoan("Pitung",100,100,1,10,10,true);
  Jubah jubahSilatPutih = Jubah("Jubah Silat Putih", 7, 50);
  Senjata golok = Senjata("Golok", 20);

  pitung.setJubah(jubahSilatPutih);
  pitung.setSenjata(golok);

  Jagoan jakaSembung = Jagoan("Jaka Sembung",100,100,1,10,10,true);
  Jubah jubahSilatHitam = Jubah("Jubah Silat Hitam", 10, 50);
  Senjata toya = Senjata("Toya", 25);

  jakaSembung.setJubah(jubahSilatHitam);
  jakaSembung.setSenjata(toya);

  pitung.info();
  jakaSembung.info();

  jakaSembung.menyerang(pitung);
  jakaSembung.menyerang(pitung);
  jakaSembung.menyerang(pitung);
  jakaSembung.menyerang(pitung);

  pitung.menyerang(jakaSembung);
  pitung.menyerang(jakaSembung);
  pitung.menyerang(jakaSembung);
  pitung.menyerang(jakaSembung);

  print("${pitung.nama}: ${pitung.getNilaiKesehatan()}");
  print("${jakaSembung.nama}: ${jakaSembung.getNilaiKesehatan()}");

  if (pitung.getStatus() && !jakaSembung.getStatus()) {
    print("${pitung.nama} Menang cuy!");
  } else if (!pitung.getStatus() && jakaSembung.getStatus()) {
    print("${jakaSembung.nama} Menang cuy!");
  } else {
    if (pitung.getNilaiKesehatan() > jakaSembung.getNilaiKesehatan()) {
      print("${pitung.nama} Menang cuy!");
    } else if (pitung.getNilaiKesehatan() < jakaSembung.getNilaiKesehatan()) {
      print("${jakaSembung.nama} Menang cuy!");
    } else {
      print("Kedua jagoan seri, cuy!");
    }
  }
}
import 'Jubah.dart';
import 'Senjata.dart';
import 'dart:io';

class Jagoan {
  String nama;
  int kesehatanDasar;
  int kekuatanDasar;
  int derajat;
  int totalKerusakan;
  int kenaikanKesehatan;
  int kenaikanKekuatan;
  bool hidup;

  Jubah? jubah;
  Senjata? senjata; 

  Jagoan(this.nama) {
    kesehatanDasar = 100;
    kekuatanDasar = 100;
    derajat = 1;
    kenaikanKekuatan = 10;
    kenaikanKesehatan = 10;
    hidup = true;
  }

  void setJubah(Jubah jubah) {
    this.jubah = jubah;
  }

  void setSenjata(Senjata senjata) {
    this.senjata = senjata;
  }

  int sehatMaksimal() {
    return kesehatanDasar +
        (jubah != null ? jubah!.getTambahKesehatan() : 0) +
        derajat * kenaikanKesehatan;
  }

  int getKekuatanSerangJagoan() {
    return kekuatanDasar +
        (senjata != null ? senjata!.getKekuatanSerang() : 0) +
        derajat * kenaikanKekuatan;
  }

  int getNilaiKesehatan() {
    return sehatMaksimal() - totalKerusakan;
  }

  void naikDerajat() {
    derajat++;
  }

  bool getStatus() {
    return hidup;
  }

  void menyerang(Jagoan lawan) {
    int kerusakan = getKekuatanSerangJagoan();

    print("$nama menyerang ${lawan.nama} dengan kekuatan $kerusakan");

    lawan.bertahan(kerusakan);

    naikDerajat();
  }

  void bertahan(int kerusakan) {
    int kekuatanBertahan = jubah != null ? jubah!.getNilaiKekuatan() : 0;
    int selisihKerusakan;
    
    print("$nama memiliki kekuatan bertahan: $kekuatanBertahan");
    
    if (kerusakan > kekuatanBertahan) {
      selisihKerusakan = kerusakan - kekuatanBertahan;
    } else {
      selisihKerusakan = 0;
    }
    
    print("Kerusakan yang diperoleh: $selisihKerusakan\n");

    // tambah total kerusakan
    totalKerusakan += selisihKerusakan;

    // periksa apakah jagoan masih hidup?
    if (getNilaiKesehatan() <= 0) {
      hidup = false;
      totalKerusakan = sehatMaksimal();
    }

    info();
  }

  void info() {
    print("Jagoan\t\t\t: $nama");
    print("Derajat\t\t\t: $derajat");
    print("Kesehatan Dasar\t\t: $kesehatanDasar");
    print("Kekuatan Dasar\t\t: $kekuatanDasar");
    print("Kesehatan\t\t: ${getNilaiKesehatan()}/$sehatMaksimal()");
    print("Kekuatan Maksimal\t: ${getKekuatanSerangJagoan()}");
    print("Masih hidup?\t\t: $hidup\n");
  }

  void getNamaJubah() {
    if (jubah != null) {
      print("Jubah\t\t\t: ${jubah!.nama}");
    } else {
      print("Jubah\t\t\t: -");
    }
  }

  void getNamaSenjata() {
    if (senjata != null) {
      print("Senjata\t\t\t: ${senjata!.nama}");
    } else {
      print("Senjata\t\t\t: -");
    }
  }
}
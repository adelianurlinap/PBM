import 'dart:io';
import 'Jubah.dart';
import 'Senjata.dart';

class Jagoan {
  String nama;
  int kesehatanDasar;
  int kekuatanDasar;
  int derajat;
  int totalKerusakan = 0;
  int kenaikanKesehatan;
  int kenaikanKekuatan;
  bool hidup;

  late Jubah jubah;
  late Senjata senjata; 

  Jagoan(this.nama,this.kesehatanDasar,this.kekuatanDasar,this.derajat,this.kenaikanKesehatan,this.kenaikanKekuatan,this.hidup);

  void setJubah(Jubah jubah) {
    this.jubah = jubah;
  }

  void setSenjata(Senjata senjata) {
    this.senjata = senjata;
  }

  String getNama() {
    return this.nama;
  }

  int sehatMaksimal() {
      return this.kesehatanDasar + this.jubah.getTambahKesehatan() + this.derajat * this.kenaikanKesehatan;
  }

  int getKekuatanSerangJagoan() {
      return this.kekuatanDasar + this.senjata.getKekuatanSerang() + this.derajat * this.kenaikanKekuatan;
  }

  int getNilaiKesehatan() {
      return sehatMaksimal() - this.totalKerusakan;
  }

  void naikDerajat() {
    this.derajat++;
  }

  bool getStatus() {
    return this.hidup;
  }

  void menyerang(Jagoan lawan) {
    int kerusakan = getKekuatanSerangJagoan();

    print("${this.nama} menyerang ${lawan.getNama()} dengan kekuatan $kerusakan");

    lawan.bertahan(kerusakan);

    naikDerajat();
  }

  void bertahan(int kerusakan) {
    //int kekuatanBertahan = jubah != null ? jubah!.getNilaiKekuatan() : 0;
    int kekuatanBertahan = this.jubah.getNilaiKekuatan();
    int selisihKerusakan;
    
    print("${this.nama} memiliki kekuatan bertahan: $kekuatanBertahan");
    
    if (kerusakan > kekuatanBertahan) {
      selisihKerusakan = kerusakan - kekuatanBertahan;
    } else {
      selisihKerusakan = 0;
    }
    
    print("Kerusakan yang diperoleh: $selisihKerusakan\n");

    // tambah total kerusakan
    this.totalKerusakan += selisihKerusakan;

    // periksa apakah jagoan masih hidup?
    if (getNilaiKesehatan() <= 0) {
      this.hidup = false;
      this.totalKerusakan = sehatMaksimal();
    }

    info();
  }

  void info() {
    print("Jagoan\t\t\t: ${this.nama}");
    print("Derajat\t\t\t: ${this.derajat}");
    print("Kesehatan Dasar\t\t: ${this.kesehatanDasar}");
    print("Kekuatan Dasar\t\t: ${this.kekuatanDasar}");
    print("Kesehatan\t\t: ${getNilaiKesehatan()}/${sehatMaksimal()}");
    print("Kekuatan Maksimal\t: ${getKekuatanSerangJagoan()}");
    print("Masih hidup?\t\t: ${this.hidup}\n");
  }
  
  void getNamaJubah() {
    print('Jubah\t\t\t: ${this.jubah.getNama()}');
  }

  void getNamaSenjata() {
    print('Senjata\t\t\t: ${this.senjata.getNama()}');
  }
}
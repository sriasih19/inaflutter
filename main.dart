// =============================================================
// Tugas KB1185 - Aplikasi Mobile | Dasar Dart
// Studi kasus: Laundry Kiloan
// Materi: Explicit typing, Sound Null Safety, final vs const, late,
//         String interpolation, List, Set, Map, Object, dynamic,
//         Immutable class
// Jalankan di https://dartpad.dev/ (single file)
// =============================================================

// ---------- const (compile-time constant) ----------
const double ppnLaundry = 0.11; // PPN 11%
const String mataUang = 'IDR';
const int batasKiloPerNota = 30;
const double biayaAntar = 5000.0;

// ---------- late (inisialisasi tertunda) ----------
late String kodeNota;

// ---------- Immutable class ----------
class RupiahFormatter {
  final String prefix;

  // const constructor: semua field wajib final
  const RupiahFormatter({required this.prefix});

  String tampil(double nilai) => '$prefix ${nilai.toStringAsFixed(0)}';
}

// ---------- Fungsi bantu ----------
void judul(String teks) {
  print('\n>>> $teks');
}

void buatKodeNota() {
  kodeNota = 'LDR-${DateTime.now().millisecondsSinceEpoch}';
  print('Kode nota: $kodeNota'); // aman dibaca karena sudah diisi
}

// Simulasi pencarian promo: hasilnya bisa ada, bisa null
String? cariPromo(String kode) {
  const Map<String, String> daftarPromo = {
    'HEMAT10': 'Diskon 10% semua layanan',
    'MEMBER': 'Diskon 10% khusus member',
  };
  return daftarPromo[kode]; // kalau kode tidak ada -> null
}

// Null safety: satu parameter nullable, tiga cara menanganinya
void tampilPromo(String? promo) {
  // ?? -> pakai nilai pengganti jika null
  String teksPromo = promo ?? 'Tanpa promo';
  print('Promo (??) : $teksPromo');

  // ?. -> jalankan hanya kalau tidak null
  print('Promo (?.) : ${promo?.toUpperCase()}');

  // ! -> paksa non-null, crash kalau ternyata null
  try {
    print('Promo (!)  : ${promo!.toUpperCase()}');
  } catch (e) {
    print('Promo (!)  : CRASH, karena nilainya null');
  }
}

// Object: periksa tipe dengan "is" sebelum operasi khusus
void periksa(Object nilai) {
  if (nilai is String) {
    print('String -> ${nilai.toUpperCase()}');
  } else if (nilai is int) {
    print('int    -> ${nilai * 2}');
  } else if (nilai is double) {
    print('double -> ${nilai / 2}');
  } else if (nilai is bool) {
    print('bool   -> ${!nilai}');
  }
}

void main() {
  // ---------- 1. Explicit typing ----------
  judul('1. Explicit Typing');
  String namaLayanan = 'Cuci Setrika';
  int jumlahMesin = 4;
  double hargaPerKilo = 8000.0;
  bool buka = true;

  jumlahMesin = 6; // nilai boleh diganti
  // jumlahMesin = 'enam'; // Error! tipe data tidak boleh berubah

  print('Layanan      : $namaLayanan');
  print('Jumlah mesin : $jumlahMesin');
  print('Harga/kilo   : $hargaPerKilo');
  print('Sedang buka  : $buka');

  // ---------- 2. Sound null safety ----------
  judul('2. Sound Null Safety');
  String namaToko = 'Laundry Bersih'; // non-nullable
  // namaToko = null; // Ditolak oleh compiler!
  print('Toko: $namaToko');

  print('-- Kode promo salah (null) --');
  tampilPromo(cariPromo('ABCDE'));

  print('-- Kode promo benar --');
  tampilPromo(cariPromo('HEMAT10'));

  // ---------- 3. final, const, late ----------
  judul('3. final, const, late');
  final String idPesanan = 'ORD-2026-01';
  final DateTime waktuMasuk = DateTime.now(); // baru diketahui saat runtime
  // idPesanan = 'ORD-0000'; // Error! final tidak bisa di-reassign

  print('ID pesanan  : $idPesanan');
  print('Waktu masuk : $waktuMasuk');
  print('PPN         : ${ppnLaundry * 100}%');
  print('Mata uang   : $mataUang');
  print('Batas kilo  : $batasKiloPerNota kg');
  buatKodeNota();

  // ---------- 4. Tipe data dasar ----------
  judul('4. Tipe Data');
  String pelangganUtama = 'Sinta';
  int umurPelanggan = 25;
  double beratCucian = 4.5;
  num angka = 7; // num bisa int atau double
  angka = 7.5;
  bool sudahBayar = false;

  print(pelangganUtama.toUpperCase());
  print('Pelanggan $pelangganUtama, umur $umurPelanggan tahun');
  print('Berat: $beratCucian kg | num: $angka | Lunas: $sudahBayar');

  // ---------- 5. List ----------
  judul('5. List');
  List<String> daftarPelanggan = ['Sinta', 'Rudi', 'Tania'];
  print('Pelanggan pertama : ${daftarPelanggan[0]}'); // indeks mulai 0
  print('Pelanggan kedua   : ${daftarPelanggan[1]}');
  daftarPelanggan.add('Bagas');
  print('Setelah add       : $daftarPelanggan');
  print('Jumlah            : ${daftarPelanggan.length}');
  print('Ada Rudi?         : ${daftarPelanggan.contains('Rudi')}');

  // ---------- 6. Set ----------
  judul('6. Set');
  Set<String> jenisLayanan = {};
  jenisLayanan.add('Cuci Kering');
  jenisLayanan.add('Setrika');
  jenisLayanan.add('Cuci Kering'); // duplikat, tidak akan tersimpan
  print('Jenis layanan: $jenisLayanan'); // {Cuci Kering, Setrika}

  // ---------- 7. Map ----------
  judul('7. Map');
  Map<String, dynamic> dataPelanggan = {
    'nama': 'Sinta',
    'berat': 4.5,
    'antarJemput': true,
  };
  print('Nama: ${dataPelanggan['nama']}');
  print('Berat: ${dataPelanggan['berat']} kg');
  print('Antar jemput: ${dataPelanggan['antarJemput']}');

  // ---------- 8. Object & dynamic ----------
  judul('8. Object & dynamic');
  periksa('laundry');
  periksa(21);
  periksa(3.5);
  periksa(true);

  dynamic status = 'Selesai';
  status = 3;
  status = false;
  print('Status dynamic sekarang: $status');

  dynamic jumlah = 50;
  try {
    print(jumlah.length); // lolos compile, gagal saat runtime
  } catch (e) {
    print('Runtime error: int tidak punya properti length');
  }

  // ---------- 9. Studi kasus: nota laundry ----------
  judul('9. Studi Kasus: Nota Laundry');
  const RupiahFormatter rupiah = RupiahFormatter(prefix: 'Rp');

  List<Map<String, dynamic>> pesanan = [
    {'layanan': 'Cuci Setrika', 'hargaPerKilo': 8000.0, 'berat': 4.5},
    {'layanan': 'Cuci Kering', 'hargaPerKilo': 6000.0, 'berat': 2.0},
    {'layanan': 'Setrika Saja', 'hargaPerKilo': 4000.0, 'berat': 3.0},
  ];

  double subtotal = 0;
  double totalKilo = 0;
  for (Map<String, dynamic> p in pesanan) {
    final double harga = p['hargaPerKilo'];
    final double berat = p['berat'];
    final double biaya = harga * berat;
    subtotal += biaya;
    totalKilo += berat;
    print('${p['layanan']} ($berat kg) = ${rupiah.tampil(biaya)}');
  }

  String? promo = cariPromo('MEMBER');
  final double diskon = promo != null ? subtotal * 0.10 : 0;
  final double setelahDiskon = subtotal - diskon;
  final double pajak = setelahDiskon * ppnLaundry;
  final double totalBayar = setelahDiskon + pajak + biayaAntar;

  if (totalKilo > batasKiloPerNota) {
    print('Peringatan: melebihi batas $batasKiloPerNota kg per nota');
  }

  print('-------------------------------');
  print('Total berat : $totalKilo kg');
  print('Subtotal    : ${rupiah.tampil(subtotal)}');
  print('Diskon      : ${rupiah.tampil(diskon)}');
  print('PPN 11%     : ${rupiah.tampil(pajak)}');
  print('Biaya antar : ${rupiah.tampil(biayaAntar)}');
  print('TOTAL BAYAR : ${rupiah.tampil(totalBayar)}');
  print('Promo       : ${promo ?? 'Tanpa promo'}');
}
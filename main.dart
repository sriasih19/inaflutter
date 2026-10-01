void main() {
  String namaTreatment = "Facial Brightening";
  int harga = 150000;
  harga = 175000;

  final String namaPelanggan = 'Agit';

  List<String> daftarTreatment = ['Facial', 'Acne Peel', 'Hair Spa'];

  Set<String> kategori = {'Facial', 'Peeling', 'Facial'};

  Map<String, dynamic> treatment = {
    'nama': 'Facial Brightening',
    'durasi': '60',
    'tersedia': true,
  };

  Object data = 'Acne Peel';
  data = true;

  if (data is String) {
    print(data.toUpperCase());
  } else {
    print('salahhh');
  }

  print(namaTreatment.toUpperCase());
  print(harga);
  print(namaPelanggan);
  print(daftarTreatment);
  print(kategori);
  print(treatment['nama']);
  print(treatment['durasi'] + ' menit');
}
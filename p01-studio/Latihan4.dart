void main() {
  final harga = {'kopi': 8000, 'teh': 5000, 'jus': 12000};
  
  int cariHarga(Map<String, int> daftar, String nama) => daftar[nama] ?? 0;

  print('Harga kopi: ${cariHarga(harga, 'kopi')}');
  print('Harga susu: ${cariHarga(harga, 'susu')}');
}

void main() {
  const katalog = <String, int>{
    'kopi': 8000,
    'teh': 5000,
    'jus': 12000,
    'roti': 7000,
  };

  String struk({
    required String pembeli,
    required List<String> pesanan,
    int diskonPersen = 0,
    int batasDiskon = 20000,
  }) {
    int total = 0;
    List<String> tidakAda = [];

    for (var item in pesanan) {
      int? hargaItem = katalog[item];
      if (hargaItem != null) {
        total += hargaItem;
      } else {
        tidakAda.add(item);
      }
    }

    int diskonBerlaku = (total >= batasDiskon) ? diskonPersen : 0;
    int potongan = (total * diskonBerlaku) ~/ 100;
    int dibayar = total - potongan;

    String textStruk = '''
Struk untuk $pembeli
Jumlah barang : ${pesanan.length}
Total : $total
Diskon : $diskonBerlaku persen, potongan $potongan
Dibayar : $dibayar''';

    if (tidakAda.isNotEmpty) {
      textStruk += '\nTidak ada di katalog: ${tidakAda.join(', ')}';
    }

    return textStruk;
  }

  print(struk(pembeli: 'Andi', pesanan: ['kopi', 'teh'], diskonPersen: 10));
  print('---');
  print(struk(pembeli: 'Budi', pesanan: ['kopi', 'jus', 'roti'], diskonPersen: 10));
  print('---');
  print(struk(pembeli: 'Cindy', pesanan: ['kopi', 'roti', 'sate'], diskonPersen: 10));
}

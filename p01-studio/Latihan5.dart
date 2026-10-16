void main() {
  String rangkum({required String nama, int diskon = 0, String? catatan}) {
    final extra = catatan != null ? '. Catatan: $catatan' : '';
    return '$nama mendapat diskon $diskon persen$extra';
  }

  print(rangkum(nama: 'Andi'));
  print(rangkum(nama: 'Budi', diskon: 10));
  print(rangkum(nama: 'Cindy', diskon: 25, catatan: 'pelanggan tetap'));
}

void main() {
  double rataRata(List<int> nilai) =>
      nilai.isEmpty ? 0.0 : nilai.reduce((a, b) => a + b) / nilai.length;

  print('Rata-rata: ${rataRata([80, 90, 75])}');
  print('Rata-rata daftar kosong: ${rataRata([])}');
}

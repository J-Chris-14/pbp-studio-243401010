import 'package:flutter/material.dart';

import 'data.dart';

void main() => runApp(const MaterialApp(home: LayarDaftar()));

// Tulis semua kode Anda di berkas ini. Kerjakan langkah U1 sampai U6 di SOAL-UTS-PBP.pdf.
// Kode yang belum jalan jadikan komentar (Cmd + / atau Ctrl + /) supaya aplikasi tetap berjalan.

// Contoh U2, membuka layar baru (hapus tanda // bila dipakai):
//   Navigator.push(
//     context,
//     MaterialPageRoute(
//       builder: (context) => Scaffold(
//         appBar: AppBar(title: Text(kos.nama)),
//         body: Center(child: Text(kos.alamat)),
//       ),
//     ),
//   );

// Layar daftar. Sudah StatefulWidget, karena di U5 kos yang terpilih disimpan di sini.
class LayarDaftar extends StatefulWidget {
  const LayarDaftar({super.key});

  @override
  State<LayarDaftar> createState() => _LayarDaftarState();
}

class _LayarDaftarState extends State<LayarDaftar> {
  // U5: kos yang tampil di kanan pada layar lebar.
  Kos dipilih = daftarKos.first;

  @override
  Widget build(BuildContext context) {
    final daftarWidget = ListView.builder(
      itemCount: daftarKos.length,
      itemBuilder: (context, index) {
        final kos = daftarKos[index];
        final statusKamar = kos.penuh ? 'Penuh' : '${kos.kamarKosong} kosong';
        return ListTile(
          title: Text(kos.nama),
          subtitle: Text('${kos.jenis}, ${kos.hargaTeks}'),
          trailing: Text(statusKamar),
          onTap: () {
            if (MediaQuery.of(context).size.width >= 600) {
              setState(() {
                dipilih = kos;
              });
            } else {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Scaffold(
                    appBar: AppBar(title: Text(kos.nama)),
                    body: DetailKos(kos: kos),
                  ),
                ),
              );
            }
          },
        );
      },
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Kos Sekitar Kampus')),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth >= 600) {
            return Row(
              children: [
                SizedBox(
                  width: 320,
                  child: daftarWidget,
                ),
                const VerticalDivider(width: 1),
                Expanded(
                  child: DetailKos(kos: dipilih),
                ),
              ],
            );
          } else {
            return daftarWidget;
          }
        },
      ),
    );
  }
}

// U3 dan U4. Isi layar detail, tanpa Scaffold. Sudah StatefulWidget, karena tombol survei berubah.
class DetailKos extends StatefulWidget {
  const DetailKos({super.key, required this.kos});

  final Kos kos;

  @override
  State<DetailKos> createState() => _DetailKosState();
}

class _DetailKosState extends State<DetailKos> {
  // U4: status tombol survei.
  bool disurvei = false;

  @override
  Widget build(BuildContext context) {
    final statusKamar = widget.kos.penuh ? 'Kamar penuh' : 'Kamar kosong: ${widget.kos.kamarKosong}'; 
    // Tulis isi detail di sini. Di dalam class State, kos dibaca dengan widget.kos.
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.kos.nama, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Text('${widget.kos.kode} — ${widget.kos.jenis}'),
        Text(widget.kos.alamat),
        Text(widget.kos.hargaTeks),
        Text(statusKamar),
        const SizedBox(height: 16),
        const Text('Fasilitas:', style: TextStyle(fontWeight: FontWeight.bold)),
        ...widget.kos.fasilitas.map((f) => Text('- $f')),
        const SizedBox(height: 24),
Center(
  child: ElevatedButton(
    onPressed: widget.kos.penuh
        ? null
        : () {
            setState(() {
              disurvei = !disurvei;
            });
          },
    child: Text(disurvei ? 'Sudah disurvei' : 'Tandai sudah disurvei'),
  ),
),
      ],
    ),
    
  );
  }
}
import 'package:flutter/material.dart';
import 'package:guyub/main.dart';
import 'package:guyub/papan_model.dart';
import 'package:provider/provider.dart';

List<ItemBacklog> duaKartu() => [
  ItemBacklog('G-1', 'Kartu satu', 'story', 3, 'To Do', 'Sekar'),
  ItemBacklog('G-2', 'Kartu dua', 'bug', 2, 'Review', null),
];

Widget aplikasi(AmbilItem ambil) => ChangeNotifierProvider(
  create: (context) => PapanModel(ambil: ambil)..muat(),
  child: const MaterialApp(home: LayarPapan()),
);

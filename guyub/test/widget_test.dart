// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:guyub/api.dart';
import 'package:guyub/isi_papan.dart';
import 'package:guyub/papan_model.dart';

void main() {
  testWidgets('Guyub displays an initial board card', (tester) async {
    final papan = PapanModel(ambil: ambilContoh);
    await papan.muat();

    await tester.pumpWidget(
      MaterialApp(home: Scaffold(body: IsiPapan(papan: papan))),
    );

    expect(find.text('Halaman menu roti'), findsOneWidget);
  });
}

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:guyub/main.dart';
import 'bantu.dart';

void main() {
  testWidgets('A2: loading lalu kartu dari model', (tester) async {
    final hasil = Completer<List<ItemBacklog>>();
    await tester.pumpWidget(aplikasi(() => hasil.future));
    await tester.pump();
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    hasil.complete(duaKartu());
    await tester.pumpAndSettle();
    expect(find.text('Kartu satu'), findsOneWidget);
  });

  testWidgets('A2: error menampilkan Coba lagi yang berfungsi', (tester) async {
    var panggilan = 0;
    await tester.pumpWidget(aplikasi(() async {
      if (panggilan++ == 0) throw Exception('mati');
      return duaKartu();
    }));
    await tester.pumpAndSettle();
    expect(find.text('Server tidak bisa dihubungi'), findsOneWidget);
    await tester.tap(find.text('Coba lagi'));
    await tester.pumpAndSettle();
    expect(find.text('Kartu dua'), findsOneWidget);
  });
}

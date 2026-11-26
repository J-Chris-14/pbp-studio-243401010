import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'bantu.dart';

void main() {
  testWidgets('B: Selesai menutup layar, status Done, ada SnackBar', (tester) async {
    await tester.pumpWidget(aplikasi(() async => duaKartu()));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Kartu satu'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Selesai'));
    await tester.pumpAndSettle();
    expect(find.text('Kartu satu selesai'), findsOneWidget);
    expect(find.text('Done'), findsOneWidget);
  });

  testWidgets('B: tombol back tidak memunculkan SnackBar', (tester) async {
    await tester.pumpWidget(aplikasi(() async => duaKartu()));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Kartu satu'));
    await tester.pumpAndSettle();
    await tester.pageBack();
    await tester.pumpAndSettle();
    expect(find.byType(SnackBar), findsNothing);
  });
}

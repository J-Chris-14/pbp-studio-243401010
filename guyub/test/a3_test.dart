import 'package:flutter_test/flutter_test.dart';
import 'package:guyub/detail_kartu.dart';
import 'bantu.dart';

void main() {
  testWidgets('A3: ketuk kartu membuka detail kartu itu', (tester) async {
    await tester.pumpWidget(aplikasi(() async => duaKartu()));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Kartu satu'));
    await tester.pumpAndSettle();
    expect(find.byType(DetailKartu), findsOneWidget);
    expect(find.text('Kode: G-1'), findsOneWidget);
  });
}

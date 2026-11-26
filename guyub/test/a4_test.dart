import 'package:flutter_test/flutter_test.dart';
import 'bantu.dart';

void main() {
  testWidgets('A4: status berubah di detail dan di papan', (tester) async {
    await tester.pumpWidget(aplikasi(() async => duaKartu()));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Kartu satu'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Pindah ke In Progress'));
    await tester.pump();
    expect(find.text('Status: In Progress'), findsOneWidget);
    await tester.pageBack();
    await tester.pumpAndSettle();
    expect(find.text('In Progress'), findsOneWidget);
    expect(find.text('To Do'), findsNothing);
  });
}

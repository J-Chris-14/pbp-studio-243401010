import 'package:flutter_test/flutter_test.dart';
import 'package:guyub/main.dart' as app;
import 'package:guyub/papan_model.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('A1: PapanModel tersedia di atas MaterialApp', (tester) async {
    app.main();
    await tester.pump();
    final konteks = tester.element(find.byType(app.LayarPapan));
    expect(konteks.read<PapanModel>(), isA<PapanModel>());
    await tester.pumpAndSettle();
  });
}

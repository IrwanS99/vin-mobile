import 'package:flutter_test/flutter_test.dart';
import 'package:vin_mobile/main.dart';

void main() {
  testWidgets('VIN Decoder app smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const VINDecoderApp());
    await tester.pumpAndSettle();
    expect(find.text('VinDecode'), findsOneWidget);
  });
}
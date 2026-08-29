import 'package:flutter_test/flutter_test.dart';
import 'package:mamika/main.dart';

void main() {
  testWidgets('App loads and splash screen is visible', (WidgetTester tester) async {
    await tester.pumpWidget(const MamikaApp());
    expect(find.byType(MamikaApp), findsOneWidget);
  });
}

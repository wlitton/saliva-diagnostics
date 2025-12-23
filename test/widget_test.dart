import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:saliva_diagnostics/main.dart';

void main() {
  testWidgets('renders empty diary state', (WidgetTester tester) async {
    await tester.pumpWidget(const SalivaDiagnosticsApp());

    expect(find.text('Start your food diary'), findsOneWidget);
    expect(find.byIcon(Icons.restaurant_menu), findsOneWidget);
  });
}

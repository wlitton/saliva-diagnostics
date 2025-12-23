import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:saliva_diagnostics/main.dart';

void main() {
  testWidgets('renders home page hero text', (WidgetTester tester) async {
    await tester.pumpWidget(const SalivaDiagnosticsApp());

    expect(find.text('Welcome to Saliva Diagnostics'), findsOneWidget);
    expect(find.byIcon(Icons.biotech_outlined), findsOneWidget);
  });
}

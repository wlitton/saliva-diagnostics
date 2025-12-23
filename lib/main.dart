import 'package:flutter/material.dart';

void main() {
  runApp(const SalivaDiagnosticsApp());
}

class SalivaDiagnosticsApp extends StatelessWidget {
  const SalivaDiagnosticsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Saliva Diagnostics',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Saliva Diagnostics'),
      ),
      body: const Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.biotech_outlined, size: 72),
            SizedBox(height: 16),
            Text(
              'Welcome to Saliva Diagnostics',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8),
            Text(
              'Get started by exploring your diagnostics workflows.',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

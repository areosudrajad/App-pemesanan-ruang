import 'package:flutter/material.dart';
import 'package:app_pemesaanan_ruang/main.dart';

class sewa_screen extends StatelessWidget {
  const sewa_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sewa Ruang'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
            // Navigate back to first route when tapped.
          },
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}

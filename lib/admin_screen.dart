import 'package:flutter/material.dart';

class admin_screen extends StatefulWidget {
  @override
  _admin_screenState createState() => _admin_screenState();
}

class _admin_screenState extends State<admin_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Terima Tolak Sewa'),
      ),
      body: Center(
          child: Column(
        children: [
          Text('Halaman Admin'),
        ],
      )),
    );
  }
}

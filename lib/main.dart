//import 'package:app_pemesaanan_ruang/screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'login_screen.dart';

int _selectedIndex = 0;
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Penyewaan Ruang Universitas Duta Bangsa Surakarta',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: login_screen(
      ),
    );
  }
}

ThemeData appTheme = ThemeData(
    primaryColor: Colors.yellow,
    /* Colors.tealAccent,*/
    secondaryHeaderColor: Colors.blue /* Colors.teal*/
    // fontFamily:
    );


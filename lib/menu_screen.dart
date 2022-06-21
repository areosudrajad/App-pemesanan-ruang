import 'package:app_pemesaanan_ruang/login_screen.dart';
import 'package:app_pemesaanan_ruang/backup/profil_screen.dart';
import 'package:app_pemesaanan_ruang/profile_screen.dart';
import 'package:flutter/material.dart';
import 'main.dart';
//import 'backup/SecondPage.dart';

import 'package:app_pemesaanan_ruang/secondpage.dart';

class menu_screen extends StatelessWidget {
//const menu_screen({Key? key, required this.title}) : super(key: key);

  //final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Center(
          child: Text("Penyewaan Ruang UDB"),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Penyewaan Ruang'),
            ),
            ListTile(
              leading: Icon(
                Icons.home,
              ),
              title: const Text('SecondPage'),
              onTap: () {
                //Navigator.pop(context);
                //onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Second()),
                );
              },
            ),
            ListTile(
              leading: Icon(
                Icons.train,
              ),
              title: const Text('Profile'),
              onTap: () {
                 Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => profile_screen()),
                );
              },
            ),
            // ListTile(
            //   leading: Icon(
            //     Icons.home,
            //   ),
            //   title: const Text('Login'),
            //   onTap: () {
            //     //Navigator.pop(context);
            //     //onPressed: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(builder: (context) => login_screen()),
            //     );
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}

import 'package:app_pemesaanan_ruang/login_screen.dart';
import 'package:app_pemesaanan_ruang/backup/profil_screen.dart';
import 'package:app_pemesaanan_ruang/profile_screen.dart';
import 'package:app_pemesaanan_ruang/sewa_screen.dart';
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
        title: Text("Penyewaan Ruang UDB"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 15,
            ),
            // An enabled button

            ElevatedButton(
              child: const Text('Sewa Ruang'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const sewa_screen()),
                );
              },
              style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  textStyle: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold)),
            ),
            SizedBox(
              height: 25,
            ),

            // // A disabled button
            // const ElevatedButton(
            //     onPressed: null, child: Text('Disabled Button')),

            ElevatedButton(
              child: const Text('Cek Status'),
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  textStyle: const TextStyle(
                    fontSize: 20,
                  )),
            ),
          ],
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
                Icons.person,
              ),
              title: const Text('Profile'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => profile_screen()),
                );
              },
            ),
            ListTile(
              leading: Icon(
                Icons.warning,
              ),
              title: const Text('Tentang'),
              onTap: () {
                AlertDialog alert = AlertDialog(
                  title: Text(
                    "UAS Rekayasa",
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  //content: Text("A2"),
                  content: SingleChildScrollView(
                    child: ListBody(
                      children: const <Widget>[
                        Text(
                          '19TIA4',
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Areo Sudrajad',
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          'Immaculata Yolia',
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          'Yuda Hernawan',
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  actions: [
                    FlatButton(
                        child: Text("Tutup"),
                        onPressed: () => Navigator.of(context).pop()),
                  ],
                );
                // show the dialog
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return alert;
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

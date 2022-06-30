import 'package:app_pemesaanan_ruang/login_screen.dart';
import 'package:app_pemesaanan_ruang/backup/profil_screen.dart';
import 'package:app_pemesaanan_ruang/profile_screen.dart';
import 'package:app_pemesaanan_ruang/sewa_screen.dart';
import 'package:flutter/material.dart';
import 'main.dart';
//import 'backup/SecondPage.dart';

import 'package:app_pemesaanan_ruang/secondpage.dart';

class menu_screen extends StatelessWidget {
  String username;
menu_screen({Key? key, required this.username}) : super(key: key);

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
                    fontSize: 20,
                  ),
                  fixedSize: const Size(250, 80),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50))),
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
                  ),
                  fixedSize: const Size(250, 80),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50))),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              //membuat gambar profil
              currentAccountPicture: Image(
                  image: NetworkImage(
                      "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png")),
              //membuat nama akun
              accountName: Text('$username'),
              //membuat nama email
              accountEmail: Text(""),
              //memberikan background
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://cdn.pixabay.com/photo/2016/04/24/20/52/laundry-1350593_960_720.jpg"),
                      fit: BoxFit.cover)),
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
                  MaterialPageRoute(builder: (context) => profile_screen(
                    usernameP: username,
                  )),
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

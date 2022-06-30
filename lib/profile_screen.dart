import 'dart:ui';

import 'package:app_pemesaanan_ruang/login_screen.dart';
import 'package:flutter/material.dart';

class profile_screen extends StatelessWidget {
  String usernameP;
  profile_screen({Key? key, required this.usernameP}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Profile"),
        ),
        body: Container(
            decoration: BoxDecoration(
                gradient:
                    LinearGradient(colors: [Colors.white, Colors.blueGrey])),
            //colors: [Colors.green, Colors.cyanAccent])),
            child: Stack(children: <Widget>[
              Positioned.fill(
                top: 150,
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xfff7f7f7),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                ),
              ),
              Positioned.fill(
                child: Column(
                  children: [
                    // SizedBox(height: 30),
                    // Text(
                    //   "Profil",
                    //   textAlign: TextAlign.center,
                    //   style: TextStyle(
                    //       fontSize: 30,
                    //       color: Colors.white,
                    //       fontWeight: FontWeight.bold),
                    // ),
                    SizedBox(height: 20),
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white,
                          width: .5,
                        ),
                      ),
                      child: Container(
                        padding: EdgeInsets.all(70),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          image: DecorationImage(
                            image: AssetImage('images/icon_user.png'),
                          ),
                        ),
                      ),
                    ),
                    Card(
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                      color: Colors.grey[300],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: ListTile(
                        leading: Icon(
                          Icons.person_outline,
                        ),
                        title: Text(
                          '$usernameP',
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                    ),
                    Card(
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                      color: Colors.grey[300],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: ListTile(
                        leading: Icon(
                          Icons.book_outlined,
                        ),
                        title: Text(
                          'Kelas',
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Container(
                        height: 1.0,
                        width: 130.0,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Card(
                      child: ElevatedButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('Logout berhasil'),
                          ));
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => login_screen(
                                  
                                )),
                          );
                        },
                        child: const Text('Logout'),
                      ),
                    ),
                  ],
                ),
              )
            ])),
      ),
    );
  }
}

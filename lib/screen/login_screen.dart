import 'package:app_pemesaanan_ruang/screen/utils/auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 41, 74),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 200),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Pemesanan Ruang',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 27,
                      color: Colors.amber),
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  'Login untuk melanjutkan',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.amber),
                ),
                SizedBox(
                  height: 25,
                ),
                TextField(
                  controller: _email,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: 'Email',
                    prefixIcon: Icon(
                      Icons.mail,
                      color: Colors.black,
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: _pass,
                  obscureText: true,
                  decoration: InputDecoration(
                      hintText: 'Password',
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Colors.black,
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12))),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                    width: double.infinity,
                    child: RawMaterialButton(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      fillColor: Colors.amber,
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      onPressed: () async {
                        String? respon =
                            await Auth.signIn(_email.text.trim(), _pass.text);
                        if (respon!.toUpperCase() ==
                            _email.text.trim().toUpperCase()) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => menu_screen(
                                      username: usernameC.text,
                                    )),
                          );
                        } else {
                          String msg;
                          switch (respon.toLowerCase()) {
                            case "invalid-email":
                              msg = "Email tidak valid";
                              break;
                            case "user-disabled":
                              msg = "Akun dibekukakn";
                              break;
                            case "user-not-found":
                              msg = "Akun tidak ditemukan";
                              break;
                            case "wrong-password":
                              msg = "Password salah";
                              break;
                            default:
                              msg = "Terjadi kesalahan";
                              break;
                          }
                          ScaffoldMessenger.of(context)
                              .showSnackBar(SnackBar(content: Text(msg)));
                        }
                      },
                      child: Text(
                        'LOGIN',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}

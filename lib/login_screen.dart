import 'package:app_pemesaanan_ruang/menu_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class login_screen extends StatefulWidget {
  const login_screen({Key? key}) : super(key: key);

  @override
  State<login_screen> createState() => _login_screenState();
}

class _login_screenState extends State<login_screen> {
  bool isChecked = false;
  TextEditingController usernameC = TextEditingController();
  TextEditingController passwordC = TextEditingController();
  String usernameadmin = 'admin';
  String passwordadmin = 'admin';
  String usernameuser = 'user';
  String passworduser = 'user';

  late Box box1;
  @override
  void initState() {
    super.initState();
    createOpenBox();
  }

  void createOpenBox() async {
    box1 = await Hive.openBox('logindata');
    getdata();
  }

  void getdata() async {
    if (box1.get('usernameC') != null) {
      usernameC.text = box1.get('usernameC');
      isChecked = true;
      setState(() {});
    }
    if (box1.get('passwordC') != null) {
      passwordC.text = box1.get('passwordC');
      isChecked = true;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 28, 52),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 230),
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
                  height: 0.1,
                ),
                Text(
                  'Login untuk melanjutkan',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.amber),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 2, vertical: 20),
                  child: TextFormField(
                    controller: usernameC,
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
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 2, vertical: 10),
                  child: TextFormField(
                    controller: passwordC,
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
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 350,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      print('username = ${usernameC.text} ');
                      if (usernameC.text == usernameadmin &&
                          passwordC.text == passwordadmin) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Login berhasil ${usernameC.text}'),
                        ));
                        login();
                        //var box = Hive.box('userBox');
                        //box.put('isLogin', true);
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => menu_screen(
                                    username: usernameC.text,
                                  )),
                        );
                        //Navigator.pushReplacement(context,
                        //MaterialPageRoute(builder: (context) => HomeScreen()));
                      } else if (usernameC.text == usernameuser &&
                          passwordC.text == passworduser) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Login berhasil ${usernameC.text}'),
                        ));
                        login();
                        //var box = Hive.box('userBox');
                        //box.put('isLogin', true);
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => menu_screen(
                                    username: usernameC.text,
                                  )),
                        );
                        //Navigator.pushReplacement(context,
                        //MaterialPageRoute(builder: (context) => HomeScreen()));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Username atau Password salah'),
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.amber,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                    child: Text(
                      'LOG IN',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void login() {
    if (isChecked) {
      box1.put('usernameC', usernameC.value.text);
      box1.put('passwordC', passwordC.value.text);
    }
  }
}

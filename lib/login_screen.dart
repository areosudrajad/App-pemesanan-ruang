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
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Text(
            'Aplikasi',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 28,
                color: Colors.black,
                height: 2),
          ),
          SizedBox(
            height: 0.1,
          ),
          Text(
            'Penyewaan Ruang UDB',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 28,
                color: Colors.black,
                height: 1),
          ),
          SizedBox(
            height: 50,
          ),
          Image.asset('images/L1.png', height: 100),
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
            child: TextFormField(
              controller: usernameC,
              decoration: InputDecoration(
                hintText: 'Masukkan username',
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
            child: TextFormField(
              controller: passwordC,
              obscureText: true,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock),
                hintText: 'Masukkan password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            width: 200,
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
                primary: Colors.blue[600],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              child: Text('LOG IN'),
            ),
          ),
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

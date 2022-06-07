//import 'package:flutter/material.dart';

//class Deals extends StatelessWidget {
  //@override
  //Widget build(BuildContext context) {
    //return Scaffold(
      //body: Center(child: Text("Deals Clicked")),
    //);
  //}
//}
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class login_screen extends StatefulWidget {
  const login_screen({Key? key}) : super(key: key);

  @override
  State<login_screen> createState() => _DealsState();
}

class _DealsState extends State<login_screen> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
            'Pemesanan Ruang',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 28,
                color: Colors.black,
                height: 1),
          ),
          SizedBox(
            height: 50,
          ),
          Image.asset('images/L1.png', height: 200),
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
            child: TextFormField(
              controller: userNameController,
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
              controller: passwordController,
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
                print('username = ${userNameController.text} ');
                if (userNameController.text == 'admin' &&
                    passwordController.text == 'admin') {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Login berhasil'),
                  ));
                  var box = Hive.box('userBox');
                  box.put('isLogin', true);

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
}

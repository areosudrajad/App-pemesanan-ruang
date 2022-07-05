import 'package:app_pemesaanan_ruang/menu_screen.dart';
import 'package:flutter/material.dart';
import 'package:app_pemesaanan_ruang/main.dart';
import 'package:app_pemesaanan_ruang/login_screen.dart';

class sewa_screen extends StatefulWidget {
  @override
  String usernameS;
  sewa_screen({Key? key, required this.usernameS}) : super(key: key);
  _sewa_screenState createState() => _sewa_screenState();
}

class _sewa_screenState extends State<sewa_screen> {
  List<String> ruang = [
    "Ruang 1",
    "Ruang 2",
    "Ruang 3",
    "Ruang 4",
    "Ruang 5",
    "Ruang 6",
    "Ruang 7",
    "Ruang 8",
    "Ruang 9",
    "Ruang 10",
    "Ruang 11",
    "Ruang 12",
    "Ruang 13",
  ];
  String nRuang = "Ruang 1";
  int? nilairuang;

  void pilihRuang(String value) {
    //menampilkan kota yang dipilih
    setState(() {
      nRuang = value;
    });
  }

  TextEditingController keteranganS = TextEditingController();

  //String usernameS;
  //_sewa_screenState({Key? key, required this.usernameS}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sewa Ruang'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 25,
            ),
            Text('Pilih ruang:'),
            DropdownButton(
              value: nRuang,
              onChanged: (String? value) {
                pilihRuang(value ?? "");
                nilairuang = ruang.indexOf(value ??
                    ""); //mengambil nilai index berdasarkan urutan list
              },
              items: ruang.map((String value) {
                return DropdownMenuItem(
                  //tampilan isi data dropdown
                  child: Text(value),
                  value: value,
                );
              }).toList(),
            ),
            Text('Keterangan:'),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
              child: TextFormField(
                controller: keteranganS,
                decoration: InputDecoration(
                  hintText: 'Masukkan keterangan',
                  //prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
            ElevatedButton(
              child: Text('Lanjut'),
              onPressed: () {
                if (keteranganS.text == '') {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Isi keterangan'),
                  ));
                  //Navigator.pushReplacement(context,
                  //MaterialPageRoute(builder: (context) => HomeScreen()));
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => konfirmasisewa(
                              ruangdipilih: nRuang,
                              keterangan: keteranganS.text,
                              username: widget.usernameS,
                            )),
                  );
                }
              },
              // style: ElevatedButton.styleFrom(
              //     primary: Colors.blue,
              //     padding:
              //         const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              //     textStyle: const TextStyle(
              //       fontSize: 20,
              //     ),
              //     fixedSize: const Size(250, 80),
              //     shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(50))),
            ),
          ],
        ),
      ),
    );
  }
}

class konfirmasisewa extends StatelessWidget {
  String ruangdipilih;
  String keterangan;
  String username;

  konfirmasisewa({
    Key? key,
    required this.ruangdipilih,
    required this.keterangan,
    required this.username,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Konfirmasi Sewa Ruang'),
      ),
      body: Center(
          child: Column(
        children: [
          SizedBox(
            height: 25,
          ),
          Text(
            'Nama :',
            style: TextStyle(
              fontSize: 15,
            ),
          ),
          Text(
            '$username',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            'Ruang yang dipilih :',
            style: TextStyle(
              fontSize: 15,
            ),
          ),
          Text(
            '$ruangdipilih',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            'Keterangan :',
            style: TextStyle(
              fontSize: 15,
            ),
          ),
          Text(
            '$keterangan',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          SizedBox(
            height: 10,
          ),
          Wrap(
            children: <Widget>[
              MaterialButton(
                child: Text('Submit'),
                color: Colors.blueGrey,
                textColor: Colors.white,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => menu_screen(
                              username: '',
                            )),
                  );
                },
              ),
              SizedBox(
                width: 5,
              ),
              // MaterialButton(
              //   child: Text('Kembali'),
              //   color: Colors.blueGrey,
              //   textColor: Colors.white,
              //   onPressed: () {
              //     Navigator.pop(context);
              //   },
              // ),
            ],
          ),
        ],
      )),
    );
  }
}

class cekstatus extends StatelessWidget {
  //const cekstatus({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Status Pemesanan Ruang'),
      ),
      body: Container(
        child: Column(
          children: [
            Row(
              children: [
                Text('Status'),
              ],
            )
          ],
        ),
      ),
    );
  }
}

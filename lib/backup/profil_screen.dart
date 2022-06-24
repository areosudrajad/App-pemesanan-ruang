import 'package:flutter/material.dart';

class profil_screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: Column(
        children: [
          Padding(padding: const EdgeInsets.only(top:30),),
          SizedBox(
            height: 115,
            width: 115,
            child: Stack(
              fit: StackFit.expand,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('images/user_icon.png'),
                ),
              ],
            ),
          ),
          
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: FlatButton(
              padding: EdgeInsets.all(20),
              shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              color: Color(0xFFF5F6F9),
              onPressed: () {},
              child: Row(
                children: [
                  Image.asset('images/user_icon.png', width: 22,),
                  SizedBox(width: 20,),
                  Expanded(
                    child: Text( "My Account"),
                  ),
                  Icon(Icons.arrow_forward_ios),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: FlatButton(
              padding: EdgeInsets.all(20),
              shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              color: Color(0xFFF5F6F9),
              onPressed: () {},
              child: Row(
                children: [
                  Image.asset('images/settings_icon.png', width: 22,),
                  SizedBox(width: 20,),
                  Expanded(
                    child: Text( "Setting"),
                  ),
                  Icon(Icons.arrow_forward_ios),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: FlatButton(
              padding: EdgeInsets.all(20),
              shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              color: Color(0xFFF5F6F9),
              onPressed: () {},
              child: Row(
                children: [
                  Image.asset('images/sign_out.png', width: 22,),
                  SizedBox(width: 20,),
                  Expanded(
                    child: Text( "Logout"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      // bottomNavigationBar: Container(
      //   padding: EdgeInsets.symmetric(vertical: 14),
      //   decoration: BoxDecoration(
      //     color: Colors.white,
      //     borderRadius: BorderRadius.only(
      //       topLeft: Radius.circular(20),
      //       topRight: Radius.circular(20),
      //     ),
      //     boxShadow: [
      //       BoxShadow(
      //         offset: Offset(0, -15),
      //         blurRadius: 20,
      //         color: Color.fromARGB(255, 214, 211, 211).withOpacity(0.15),
      //       ),
      //     ],
      //   ),
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceAround,
      //     children: [
      //       IconButton(
      //         icon: Icon(Icons.home),
      //         onPressed: () {},
      //       ),
      //       IconButton(
      //         icon: Icon(Icons.post_add),
      //         onPressed: () {},
      //       ),
      //       IconButton(
      //         icon: Icon(Icons.manage_accounts),
      //         onPressed: () {
      //           Navigator.of(context).pushReplacement(
      //               MaterialPageRoute(builder: (_) => profil_screen()),
      //           );
      //         },
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
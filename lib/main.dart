import 'package:app_pemesaanan_ruang/screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'Notifications.dart' as prefix0;
import 'login_screen.dart';
import 'SecondPage.dart';
import 'profil_screen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: BottomNav(),
    theme: appTheme,
    title: "UAS Rekyasa Areo Yolia Yuda",
  ));
}

ThemeData appTheme = ThemeData(
    primaryColor: Colors.yellow,
    /* Colors.tealAccent,*/
    secondaryHeaderColor: Colors.blue /* Colors.teal*/
    // fontFamily:
    );

int sel = 0;
double? width;
double? height;
final bodies = [
  menu_screen(),
  profil_screen(),
  login_screen(),
  //prefix0.Notification()
];

class BottomNav extends StatefulWidget {
  BottomNav({Key? key}) : super(key: key);

  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  List<BottomNavigationBarItem> createItems() {
    List<BottomNavigationBarItem> items = [];
    items.add(BottomNavigationBarItem(
        activeIcon: Icon(
          Icons.home,
          color: appTheme.primaryColor,
        ),
        icon: Icon(
          Icons.home,
          color: Colors.black,
        ),
        label: "Explore"));
    items.add(BottomNavigationBarItem(
        activeIcon: Icon(
          Icons.man,
          color: appTheme.primaryColor,
        ),
        icon: Icon(
          Icons.man,
          color: Colors.black,
        ),
        label: "Profil"));
    items.add(BottomNavigationBarItem(
        activeIcon: Icon(
          Icons.login,
          color: appTheme.primaryColor,
        ),
        icon: Icon(
          Icons.login,
          color: Colors.black,
        ),
        label: "Login"));
    // items.add(BottomNavigationBarItem(
    //     activeIcon: Icon(
    //       Icons.notifications,
    //       color: appTheme.primaryColor,
    //     ),
    //     icon: Icon(
    //       Icons.notifications,
    //       color: Colors.black,
    //     ),
    //     label: "Notifications"));
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: bodies.elementAt(sel),
        bottomNavigationBar: BottomNavigationBar(
          items: createItems(),
          unselectedItemColor: Colors.black,
          selectedItemColor: appTheme.primaryColor,
          type: BottomNavigationBarType.shifting,
          showUnselectedLabels: false,
          showSelectedLabels: true,
          currentIndex: sel,
          elevation: 1.5,
          onTap: (int index) {
            if (index != sel)
              setState(() {
                sel = index;
              });
          },
        ));
  }
}

class menu_screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Menu Clicked")),
    );
  }
}

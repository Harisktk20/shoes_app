
import 'package:flutter/material.dart';

import 'package:showes_app/screens/fav_screen.dart';
import 'package:showes_app/screens/home_screen.dart';
import 'package:showes_app/screens/notification_screen.dart';
import 'package:showes_app/screens/profile_screen.dart';

class BottomScreen extends StatefulWidget {
  const BottomScreen({super.key});

  @override
  State<BottomScreen> createState() => _BottomScreenState();
}

int selectIndex = 0;
List isList = [
  const HomeScreen(),
  const FavScreen(),
  const NotifnScreen(),
  const ProfileScreen()
];

class _BottomScreenState extends State<BottomScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 252, 250, 250),
      body: isList[selectIndex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 0.0),
        child: ClipRRect(
          borderRadius: BorderRadius.only(topLeft: Radius.zero),
          child: BottomNavigationBar(
            unselectedItemColor: Colors.black,
            selectedItemColor: Colors.blue,
            //showUnselectedLabels: true,
            showSelectedLabels: false,
            onTap: (index) {
              setState(() {
                selectIndex = index;
              });
            },
            currentIndex: selectIndex,
            backgroundColor: Colors.white,
            items: const [
              BottomNavigationBarItem(
                label: "home",
                icon: Icon(Icons.shopping_bag),
              ),
              BottomNavigationBarItem(
                label: "fav",
                icon: Icon(Icons.favorite_border),
              ),
              BottomNavigationBarItem(
                label: "Noti",
                icon: Icon(Icons.notifications_outlined),
              ),
              BottomNavigationBarItem(label: "Profile",
                icon: Icon(Icons.person),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

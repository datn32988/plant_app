import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:plant_app/screens/cart_screen.dart';
import 'package:plant_app/screens/fav_screen.dart';

import 'package:plant_app/screens/main_screen.dart';
import 'package:plant_app/screens/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  FirebaseAuth auth = FirebaseAuth.instance;
  int selectedIndex = 0;

  List<Widget> screens = const <Widget>[
    MainScreen(),
    FavScreen(),
    CartScreen(),
    ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              "images/image1.png",
              scale: 14,
            ),
            const SizedBox(
              width: 10,
            ),
            const Text(
              "Plant Shop",
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 30),
            ),
          ],
        ),
        automaticallyImplyLeading: false,
      ),
      body: screens[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            selectedIndex = index;
            setState(() {});
          },
          currentIndex: selectedIndex,
          selectedItemColor: Colors.green,
          unselectedLabelStyle: const TextStyle(color: Colors.grey),
          showSelectedLabels: true,
          unselectedItemColor: Colors.grey,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home_filled), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: "Favourrite"),
            BottomNavigationBarItem(
                icon: Icon(Icons.card_travel_sharp), label: "Cart"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ]),
    );
  }
}

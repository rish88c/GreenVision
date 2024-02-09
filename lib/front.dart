import 'package:flutter/material.dart';

import 'database.dart';
import 'user.dart';
import 'home.dart';

class Front extends StatefulWidget {
  const Front({Key? key}) : super(key: key);
  @override
  State<Front> createState() => _MyAppState();
}

class _MyAppState extends State<Front> {
  int currentIndex = 0;

  final screens = [const Home(), const Database(), const User()];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: Scaffold(
        body: screens[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.teal.shade300,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white70,
          showUnselectedLabels: false,
          currentIndex: currentIndex,
          onTap: (int index) {
            setState(() {
              currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.home)),
            BottomNavigationBarItem(
                label: 'Database', icon: Icon(Icons.dataset)),
            BottomNavigationBarItem(label: 'User', icon: Icon(Icons.person))
          ],
        ),
      ),
    );
  }
}

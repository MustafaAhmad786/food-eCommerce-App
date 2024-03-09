import 'dart:ui';

import 'package:e_commerced_app/pages/Home_page.dart';
import 'package:e_commerced_app/pages/pizza_details.dart';
import 'package:e_commerced_app/pages/wallet_page.dart';
import 'package:e_commerced_app/pages/setting.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class bottomNavigation extends StatefulWidget {
  const bottomNavigation({Key? key});

  @override
  State<bottomNavigation> createState() => _bottomNavigationState();
}

class _bottomNavigationState extends State<bottomNavigation> {
  int currentindex = 0;
  List pages = [
    HomePage(),
    PizzaDetails(),
    setting(),
    search(),
  ];

  void ontap(int index) {
    setState(() {
      currentindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: pages[currentindex], // Widget to display on the background
          ),
          Positioned(
            left: 18,
            right: 18,
            bottom: 18,
            height: 60,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(52),
                    bottomRight: Radius.circular(52),
                  ),
                  border: Border.all(width: 1.5, color: Colors.blue)),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                  bottomLeft: Radius.circular(52),
                  bottomRight: Radius.circular(52),
                ), // Circular border radius
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
                  child: GNav(
                    onTabChange: ontap,
                    selectedIndex: currentindex,
                    padding: EdgeInsets.all(10),
                    backgroundColor: Colors.transparent,
                    activeColor: Colors.blue,
                    tabMargin: EdgeInsets.all(7),
                    gap: 8,
                    tabBackgroundColor: Color.fromARGB(255, 56, 55, 55),
                    tabs: [
                      GButton(
                        icon: Icons.home,
                        text: 'home',
                        iconSize: 18,
                      ),
                      GButton(
                        icon: Icons.shopping_bag_outlined,
                        text: 'shopping',
                        iconSize: 18,
                      ),
                      GButton(
                        icon: Icons.wallet_outlined,
                        text: 'wallet',
                        iconSize: 18,
                      ),
                      GButton(
                        icon: Icons.person,
                        text: 'person',
                        iconSize: 18,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

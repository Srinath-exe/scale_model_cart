import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:scale_model_cart/Screens/Category/categoryPage.dart';
import 'package:scale_model_cart/Screens/HomePage/home_screen.dart';
import 'package:scale_model_cart/Screens/HomePage/search_screen.dart';
import 'package:scale_model_cart/widgets/HomeDrawer.dart';

import '../../constants/constants.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  List<Widget> tabItems = [
    HomeScreen(),
    SearchScreen(),
    CategoryPage(),
    Center(child: Text("4"))
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: HomeDrawer(),
      body: tabItems[_selectedIndex],
      bottomNavigationBar: FlashyTabBar(
        backgroundColor: accent,
        iconSize: 22,
        animationCurve: Curves.easeIn,
        animationDuration: Duration(milliseconds: 200),
        selectedIndex: _selectedIndex,
        showElevation: true, // use this to remove appBar's elevation
        onItemSelected: (index) => setState(() {
          _selectedIndex = index;
        }),
        items: [
          FlashyTabBarItem(
            icon: Icon(Icons.home_filled),
            title: Text('Home'),
          ),
          FlashyTabBarItem(
            icon: Icon(Icons.search_rounded),
            title: Text('Search'),
          ),
          FlashyTabBarItem(
            icon: Icon(Icons.dashboard_rounded),
            title: Text('Categories'),
          ),
          FlashyTabBarItem(
            icon: Icon(Icons.person_rounded),
            title: Text('Profile'),
          ),
        ],
      ),
    );
  }
}

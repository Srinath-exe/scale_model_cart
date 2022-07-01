import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:scale_model_cart/Screens/Category/categoryPage.dart';
import 'package:scale_model_cart/Screens/HomePage/home_screen.dart';
import 'package:scale_model_cart/Screens/HomePage/profilescreen.dart';
import 'package:scale_model_cart/Screens/HomePage/search_screen.dart';
import 'package:scale_model_cart/widgets/HomeDrawer.dart';

import '../../constants/constants.dart';
import '../Cartpage/Cart.dart';

class MainScreen extends StatefulWidget {
  int? selectedIndex;
  MainScreen({Key? key, this.selectedIndex = 0}) : super(key: key);

  @override
  State<MainScreen> createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  List<Widget> tabItems = [
    HomeScreen(),
    SearchScreen(),
    CategoryPage(),
    CartPage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: HomeDrawer(),
      body: tabItems[widget.selectedIndex!],
      bottomNavigationBar: FlashyTabBar(
        backgroundColor: secondary,
        iconSize: 22,
        animationCurve: Curves.easeIn,
        animationDuration: Duration(milliseconds: 200),
        selectedIndex: widget.selectedIndex!,
        showElevation: false, // use this to remove appBar's elevation
        onItemSelected: (index) => setState(() {
          widget.selectedIndex = index;
        }),
        items: [
          FlashyTabBarItem(
            activeColor: accent,
            icon: Icon(
              Icons.home_filled,
              color: accent,
            ),
            title: Text('Home', style: style),
          ),
          FlashyTabBarItem(
            activeColor: accent,
            icon: Icon(
              Icons.search_rounded,
              color: accent,
            ),
            title: Text('Search', style: style),
          ),
          FlashyTabBarItem(
            activeColor: accent,
            icon: Icon(
              Icons.dashboard_rounded,
              color: accent,
            ),
            title: Text('Categories', style: style),
          ),
          FlashyTabBarItem(
            activeColor: accent,
            icon: Icon(
              Icons.person_rounded,
              color: accent,
            ),
            title: Text('Profile', style: style),
          ),
        ],
      ),
    );
  }
}

TextStyle style = TextStyle(color: accent, fontWeight: FontWeight.w600);

import 'package:flutter/material.dart';
import 'package:flutter_search_bar/main.dart';
import 'package:scale_model_cart/Screens/HomePage/main_screen.dart';
import 'package:scale_model_cart/constants/constants.dart';
import 'package:scale_model_cart/widgets/HomeDrawer.dart';

import '../Authentication/authscreen.dart';
import '../Cartpage/Cart.dart';
import '../Category/categoryPage.dart';
import '../WishList/WishList.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondary,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: ListView(
            padding: EdgeInsets.all(15),
            children: <Widget>[
              Material(
                elevation: 40,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Container(
                  // height: MediaQuery.of(context).size.height * 0.1,
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: accent),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Material(
                        color: Colors.transparent,
                        shape: CircleBorder(),
                        elevation: 10,
                        child: CircleAvatar(
                          backgroundColor: secondary,
                          radius: 60,
                          child: Image.asset("assets/images/avatar.png"),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Srinath',
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black),
                              textScaleFactor: 1,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.45,
                              child: Text(
                                '1406srinath@gmail',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey[800]),
                                textScaleFactor: 1,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              ListTile(
                onTap: () {
                  Navigator.pop(context);
                },
                leading: Icon(Icons.home, color: accent),
                title: Text(
                  'Home',
                  style: TextStyle(color: light),
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WishList(),
                      ));
                },
                leading: Icon(Icons.favorite, color: accent),
                title: Text(
                  'Whislist',
                  style: TextStyle(color: light),
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MainScreen(
                          selectedIndex: 3,
                        ),
                      ));
                },
                leading: Icon(Icons.shopping_cart, color: accent),
                title: Text(
                  'Cart',
                  style: TextStyle(color: light),
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MainScreen(
                          selectedIndex: 2,
                        ),
                      ));
                },
                leading: Icon(Icons.dashboard, color: accent),
                title: Text(
                  'Category',
                  style: TextStyle(color: light),
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AuthScreen(),
                      ));
                },
                leading: Icon(Icons.exit_to_app, color: accent),
                title: Text(
                  'Log out',
                  style: TextStyle(color: light),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

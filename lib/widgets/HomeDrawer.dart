import 'package:flutter/material.dart';
import 'package:scale_model_cart/Screens/Authentication/authscreen.dart';
import 'package:scale_model_cart/Screens/Cartpage/Cart.dart';
import 'package:scale_model_cart/Screens/Category/categoryPage.dart';

import 'package:scale_model_cart/Screens/WishList/WishList.dart';
import 'package:scale_model_cart/constants/constants.dart';

class HomeDrawer extends StatefulWidget {
  const HomeDrawer({Key? key}) : super(key: key);

  @override
  _HomeDrawerState createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(12.0),
        color: Colors.transparent,
        child: Container(
          width: MediaQuery.of(context).size.width * 0.75,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Colors.white),
          child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: ListView(
              padding: EdgeInsets.all(15),
              children: <Widget>[
                Material(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.1,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: accent),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Material(
                          color: Colors.transparent,
                          shape: CircleBorder(),
                          elevation: 10,
                          child: CircleAvatar(
                            backgroundColor: secondary,
                            radius: 30,
                            child: Image.asset("assets/images/avatar.png"),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.45,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'Srinath',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black),
                                      textScaleFactor: 1,
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.45,
                                      child: Text(
                                        '1406srinath@gmail',
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.grey[800]),
                                        textScaleFactor: 1,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
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
                  leading: Icon(Icons.home, color: secondary),
                  title: Text(
                    'Home',
                    style: TextStyle(color: secondary),
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
                  leading: Icon(Icons.favorite, color: secondary),
                  title: Text(
                    'Whislist',
                    style: TextStyle(color: secondary),
                  ),
                ),
                ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CartPage(),
                        ));
                  },
                  leading: Icon(Icons.shopping_cart, color: secondary),
                  title: Text(
                    'Cart',
                    style: TextStyle(color: secondary),
                  ),
                ),
                // ListTile(
                //   leading: Icon(Icons.settings),
                //   title: Text('Settings'),
                // ),
                ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CategoryPage(),
                        ));
                  },
                  leading: Icon(Icons.dashboard, color: secondary),
                  title: Text(
                    'Category',
                    style: TextStyle(color: secondary),
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
                  leading: Icon(Icons.exit_to_app, color: secondary),
                  title: Text(
                    'Log out',
                    style: TextStyle(color: secondary),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

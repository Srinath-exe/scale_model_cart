import 'dart:math';

import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:scale_model_cart/Screens/Category/categoryPage.dart';
import 'package:scale_model_cart/Screens/HomePage/productPage.dart';
import 'package:scale_model_cart/Screens/HomePage/search_screen.dart';
import 'package:scale_model_cart/constants/constants.dart';

import '../../widgets/HomeDrawer.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int curr = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondary,
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  appBar(),
                  SizedBox(
                    height: 20,
                  ),
                  promo(),
                  SizedBox(
                    height: 20,
                  ),
                  search(),
                  SizedBox(
                    height: 20,
                  ),
                  tags(),
                ],
              ),
            ),
            banner(),
            prodRow("Top Deal's"),
          ],
        )),
      ),
    );
  }

  promo() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Lorem ipsum dolor sit ,",
            style: TextStyle(
                color: light, fontSize: 28, fontWeight: FontWeight.w600),
          ),
          Text(
            "tincidunt cursus",
            style: TextStyle(
                color: accent, fontSize: 28, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }

  appBar() {
    return Container(
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () => scaffoldKey.currentState!.openDrawer(),
              child: Transform(
                alignment: Alignment.center,
                transform: Matrix4.rotationY(3.14),
                child: Container(
                  width: GetSize().width(context) * 0.07,
                  child: Image.asset("assets/images/menu.png"),
                ),
              ),
            ),
            Material(
              color: Colors.transparent,
              shape: CircleBorder(),
              elevation: 20,
              child: CircleAvatar(
                backgroundColor: accent,
                radius: 22,
                child: Image.asset("assets/images/avatar.png"),
              ),
            ),
          ]),
    );
  }

  tags() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ac("SUV", 0),
          ac("luxury", 1),
          ac("Bikes", 2),
          ac("Sports Car", 3),
          ac("Super Car", 4),
        ],
      ),
    );
  }

  ac(String text, int index) {
    bool active;
    active = index == curr ? true : false;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          setState(() {
            curr = index;
          });
        },
        borderRadius: BorderRadius.circular(10),
        child: Material(
          color: Colors.transparent,
          elevation: active ? 6 : 2,
          // shadowColor: active ? accent : secondaryLight,
          borderRadius: BorderRadius.circular(10),
          child: AnimatedContainer(
            duration: Duration(milliseconds: 250),
            curve: Curves.ease,
            decoration: BoxDecoration(
                color: active ? accent : secondaryLight,
                borderRadius: BorderRadius.circular(10)),
            padding: EdgeInsets.all(8),
            child: Column(
              children: [
                Image.asset(
                  "assets/images/image_01.png",
                  width: 70,
                ),
                // SizedBox(
                //   height: 8,
                // ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    text,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: active ? FontWeight.w600 : FontWeight.w500,
                        color: !active ? light.withOpacity(0.7) : secondary),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget catergory() {
    return Container(
      // height: MediaQuery.of(context).size.height * 0.2,
      // width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              color: Colors.transparent,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.8),
                        BlendMode
                            .dstATop), //I assumed you want to occupy the entire space of the card
                    image: AssetImage(
                      'assets/images/bg1.png',
                    ),
                  ),
                ),
                child: ListTile(
                  selectedTileColor: Colors.black,
                  tileColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                      side: BorderSide(width: 1, color: Colors.purple)),
                  onTap: () {
                    setState(() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CategoryPage()));
                    });
                  },
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  leading: Container(
                    padding: EdgeInsets.only(right: 12.0),
                    decoration: new BoxDecoration(
                        border: new Border(
                            right: new BorderSide(
                                width: 1.0, color: Colors.white24))),
                    child: Icon(Icons.dashboard, color: Colors.black),
                  ),
                  title: Text(
                    "Categories",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25.0,
                        fontFamily: "Calibre-Semibold",
                        letterSpacing: 1.0,
                        fontWeight: FontWeight.bold),
                  ),
                  trailing: Container(
                    decoration: BoxDecoration(
                      color: Colors.purple,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Icon(Icons.keyboard_arrow_right,
                        color: Colors.white, size: 30.0),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  banner() {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Container(
        width: GetSize().width(context),
        height: 160,
        decoration: BoxDecoration(
            color: accent, borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}

search() {
  return Material(
    elevation: 20,
    shadowColor: secondary.withOpacity(0.5),
    borderRadius: BorderRadius.circular(10),
    color: secondaryLight,
    child: Container(
      height: 50,

      // decoration: BoxDecoration(
      //     color: accent.withOpacity(0.1),
      //     borderRadius: BorderRadius.only(
      //         topRight: Radius.circular(10),
      //         bottomLeft: Radius.circular(10),
      //         topLeft: Radius.circular(30),
      //         bottomRight: Radius.circular(30))),
      // alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.search_rounded,
              color: light,
            ),
          ),
          // SizedBox(
          //   width: GetSize().width(context) * 0.01,
          // ),
          Text(
            "Search...",
            style: TextStyle(color: light.withOpacity(0.6)),
          )
        ],
      ),
    ),
  );
}

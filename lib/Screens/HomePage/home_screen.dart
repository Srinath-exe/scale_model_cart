import 'dart:math';

import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:page_route_transition/page_route_transition.dart';
import 'package:scale_model_cart/Models/product_model.dart';
import 'package:scale_model_cart/Screens/Category/categoryPage.dart';
import 'package:scale_model_cart/Screens/HomePage/main_screen.dart';
import 'package:scale_model_cart/Screens/HomePage/productPage.dart';
import 'package:scale_model_cart/Screens/HomePage/profilescreen.dart';
import 'package:scale_model_cart/Screens/HomePage/search_screen.dart';
import 'package:scale_model_cart/Screens/WishList/WishList.dart';
import 'package:scale_model_cart/constants/constants.dart';
import 'package:scale_model_cart/widgets/buttons.dart';

import '../../widgets/HomeDrawer.dart';

class HomeScreen extends StatefulWidget {
  void Function()? onTap;
  HomeScreen({Key? key, this.onTap}) : super(key: key);

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
            prodRow("Top Deal's", 0),
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
            //  "Lorem ipsum dolor sit ,"
            "Discover The World of Model Cars ,",
            style: TextStyle(
                color: light, fontSize: 20, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 2,
          ),
          Text(
            // "Scale Model Cars",
            "Latest Collections",
            style: TextStyle(
                letterSpacing: 1,
                color: accent,
                fontSize: 28,
                fontWeight: FontWeight.w600),
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
            Container(
              width: GetSize().width(context) * 0.3,
              child: Image.asset("assets/images/logo.png"),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  Navigator.push(
                      context,
                      PageRouteTransitionBuilder(
                          page: ProfileScreen(),
                          curve: Curves.easeOut,
                          duration: Duration(milliseconds: 600),
                          effect: TransitionEffect.topToBottom));
                });
              },
              child: Material(
                color: Colors.transparent,
                shape: CircleBorder(),
                elevation: 20,
                child: CircleAvatar(
                  backgroundColor: accent,
                  radius: 22,
                  child: Image.asset("assets/images/avatar.png"),
                ),
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
          ac("F1", 0, cars[3].img[0]),
          ac("Super Car", 1, cars[9].img[0]),
          ac("SUV", 2, cars[7].img[0]),
          ac("luxury", 3, cars[1].img[0]),
          ac("Sports Car", 4, cars[10].img[0]),
          ac("Bikes", 5, cars[8].img[0]),
        ],
      ),
    );
  }

  ac(String text, int index, String url) {
    bool active;
    active = index == curr ? true : false;
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: InkWell(
        onTap: () {
          setState(() {
            curr = index;
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ProductPage(title: text)));
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
                  url,
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
    tile(String url) {
      return Container(
        width: 80,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
            color: secondary,
            shape: BoxShape.circle,
            border: Border.all(color: Colors.black, width: 3)),
        child: Image.asset(
          url,
          width: 60,
          fit: BoxFit.fitWidth,
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Container(
        padding: EdgeInsets.all(8),
        width: GetSize().width(context),
        height: 150,
        decoration: BoxDecoration(
            color: accent, borderRadius: BorderRadius.circular(20)),
        child: Stack(alignment: AlignmentDirectional.topStart, children: [
          Positioned(
            right: 0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "\$ 1280 ",
                    style: TextStyle(
                        fontSize: 24,
                        color: secondary,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "Total  ",
                    style: TextStyle(
                        fontSize: 18,
                        color: secondary,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            child: Stack(
                children: List.generate(
              3,
              (index) => Positioned(
                left: index * 45,
                child: tile(
                  cars[index].img[0],
                ),
              ),
            )),
          ),
          Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // TextButton(
                  //   style: OutlinedButton.styleFrom(side: BorderSide()),
                  //   onPressed: () {},
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       Text(
                  //         "View Wishlist",
                  //         style: TextStyle(
                  //             color: secondary,
                  //             letterSpacing: 1,
                  //             fontWeight: FontWeight.w600),
                  //       ),
                  //       Padding(
                  //         padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  //         child: Icon(
                  //           Icons.favorite_rounded,
                  //           color: secondary,
                  //         ),
                  //       )
                  //     ],
                  //   ),
                  // ),
                  ThemeButton(
                    padding: 2,
                    text: "",
                    height: 40,
                    outlineButton: true,
                    width: GetSize().width(context) * 0.45,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "View Wishlist",
                          style: TextStyle(
                              color: secondary,
                              letterSpacing: 1,
                              fontWeight: FontWeight.w600),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Icon(
                            Icons.favorite_rounded,
                            color: secondary,
                          ),
                        )
                      ],
                    ),
                    onTap: () {
                      setState(() {
                        Navigator.push(
                            context,
                            PageRouteTransitionBuilder(
                                page: WishList(),
                                curve: Curves.easeOut,
                                duration: Duration(milliseconds: 600),
                                effect: TransitionEffect.bottomToTop));
                      });
                    },
                  ),
                  ThemeButton(
                      padding: 2,
                      height: 40,
                      width: GetSize().width(context) * 0.3,
                      text: "Check out",
                      onTap: widget.onTap),
                ],
              ))
        ]),
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

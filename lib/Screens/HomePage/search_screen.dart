import 'package:flutter/material.dart';
import 'package:scale_model_cart/Screens/HomePage/productPage.dart';
import 'package:scale_model_cart/constants/constants.dart';

import 'home_screen.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondary,
      body: SafeArea(
          child: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Search",
                    style: TextStyle(
                        color: light,
                        fontSize: 22.0,
                        fontFamily: "Calibre-Semibold",
                        letterSpacing: 1.0,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  search(),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            prodRow("Best Sellers", 3),
            prodRow("Recent Search", 6),
          ],
        ),
      )),
    );
  }
}

prodRow(String title, int vari) {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: light, fontSize: 18, fontWeight: FontWeight.w500),
            ),
            Text(
              "See all",
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: light.withOpacity(0.6),
                  fontSize: 14,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
      niceRow(variaton: vari),
    ],
  );
}

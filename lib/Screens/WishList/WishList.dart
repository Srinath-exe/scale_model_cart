import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:scale_model_cart/Screens/Cartpage/Cart.dart';
import 'package:scale_model_cart/Screens/HomePage/home_screen.dart';

import 'package:scale_model_cart/Screens/ProductViewpage/ProductPage.dart';
import 'package:scale_model_cart/constants/constants.dart';
import 'package:scale_model_cart/widgets/WishList_card.dart';

import '../../Models/product_model.dart';
import '../HomePage/productPage.dart';
import '../ProductViewpage/product_detail_view.dart';

class WishList extends StatefulWidget {
  WishList({Key? key}) : super(key: key);

  @override
  _WishListState createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondary,
      body: SafeArea(
        child: SingleChildScrollView(
            child: Column(
          children: [
            appbar(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Column(
              children: List.generate(8, (index) => tile(cars[index + 3])),
            )
          ],
        )),
      ),
    );
  }

  Widget appbar() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.06,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: light,
            ),
            onPressed: () {
              setState(() {
                Navigator.pop(context);
              });
            },
          ),
          Text(
            "Wishlist",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w500, color: light),
            textScaleFactor: 1,
          ),
          IconButton(
            icon: Icon(
              Icons.shopping_bag_outlined,
              color: accent,
            ),
            onPressed: () {
              setState(() {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CartPage()),
                );
              });
            },
          ),
        ]),
      ),
    );
  }

  Widget emptywishList() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              Image.asset("assets/images/emptywishlist.png"),
              Text(
                "Your Wishlist is Empty",
                style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
                textScaleFactor: 1,
              ),
              Text(
                "Tap the heart button to start saving your favourite items",
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[500]),
                textScaleFactor: 1,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              TextButton(
                  // highlightedBorderColor: Colors.black,
                  // borderSide: BorderSide(color: Colors.black),
                  child: Text(
                    "ADD NOW",
                    style: TextStyle(color: Colors.black),
                  ),
                  onPressed: () {
                    setState(() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomeScreen()));
                    });
                  }),
            ],
          ),
        ),
      ),
    );
  }

  tile(Car car) {
    return OpenContainer(
      closedColor: secondary,
      transitionDuration: Duration(milliseconds: 1000),
      closedBuilder: (context, VoidCallback openContainer) =>
          WishListCard(img: car.img[0], price: car.price, name: car.name),
      openBuilder: (context, _) => ProductScreen(
        car: car,
      ),
    );
  }
}

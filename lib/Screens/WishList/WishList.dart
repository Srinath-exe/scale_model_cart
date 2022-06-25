import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:scale_model_cart/Screens/Cartpage/Cart.dart';
import 'package:scale_model_cart/Screens/HomePage/home.dart';
import 'package:scale_model_cart/Screens/ProductViewpage/ProductPage.dart';
import 'package:scale_model_cart/widgets/WishList_card.dart';

class WishList extends StatefulWidget {
  WishList({Key? key}) : super(key: key);

  @override
  _WishListState createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        body: SingleChildScrollView(
            child: Column(
          children: [
            appbar(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            // emptywishList(),
            OpenContainer(
                closedColor: Colors.white70,
                transitionDuration: Duration(seconds: 1),
                closedBuilder: (context, VoidCallback openContainer) =>
                    WishListCard(
                        img:
                            "https://www.scalemodelcart.com/usrfile/40002-18_Norev_Mercedes_Maybach_S_650_a.jpg",
                        price: 13880.00,
                        name: 'Mercedes Maybach S 650'),
                openBuilder: (context, _) => ProductPage()),
            OpenContainer(
                closedColor: Colors.white70,
                transitionDuration: Duration(seconds: 1),
                closedBuilder: (context, VoidCallback openContainer) =>
                    WishListCard(
                        img:
                            "https://www.scalemodelcart.com/usrfile/40002-18_Solido_S1803004_Ford_GT40_a.jpg",
                        price: 7880.00,
                        name: 'Ford GT40'),
                openBuilder: (context, _) => ProductPage()),
            OpenContainer(
                closedColor: Colors.white70,
                transitionDuration: Duration(seconds: 1),
                closedBuilder: (context, VoidCallback openContainer) =>
                    WishListCard(
                        img:
                            "https://www.scalemodelcart.com/usrfile/40002-18_Solido_S1803004_Ford_GT40_a.jpg",
                        price: 7880.00,
                        name: 'Ford GT40'),
                openBuilder: (context, _) => ProductPage()),
            OpenContainer(
                closedColor: Colors.white70,
                transitionDuration: Duration(seconds: 1),
                closedBuilder: (context, VoidCallback openContainer) =>
                    WishListCard(
                      img:
                          "https://www.scalemodelcart.com/usrfile/40002-18_CMR175_Mazda_787B_LeMans_Gachot_a.jpg",
                      name: "Mazda 787B LeMans",
                      price: 9855.00,
                    ),
                openBuilder: (context, _) => ProductPage()),

            OpenContainer(
                closedColor: Colors.white70,
                transitionDuration: Duration(seconds: 1),
                closedBuilder: (context, VoidCallback openContainer) =>
                    WishListCard(
                        img:
                            "https://www.scalemodelcart.com/usrfile/40011-18_AM_Vulcan_a.jpeg",
                        price: 12000.0,
                        name: 'Aston Martin Valcun'),
                openBuilder: (context, _) => ProductPage()),

            OpenContainer(
                closedColor: Colors.white70,
                transitionDuration: Duration(seconds: 1),
                closedBuilder: (context, VoidCallback openContainer) =>
                    WishListCard(
                        img:
                            "https://www.scalemodelcart.com/usrfile/40002-18_Norev183497_Mb_AMG_GT_S_a.jpg",
                        price: 8655.0,
                        name: 'Mercedes Benz AMG GT-S'),
                openBuilder: (context, _) => ProductPage()),

            //  WishListCard(
            //         img:
            //             "https://www.scalemodelcart.com/usrfile/40002-18_Norev_Mercedes_Maybach_S_650_a.jpg",
            //         price: 13880.00,
            //         name: 'Mercedes Maybach S 650'),
            //     WishListCard(
            //         img:
            //             "https://www.scalemodelcart.com/usrfile/40002-18_Solido_S1803004_Ford_GT40_a.jpg",
            //         price: 7880.00,
            //         name: 'Ford GT40'),
            //     WishListCard(
            //         img:
            //             "https://www.scalemodelcart.com/usrfile/40002-18_Shelby_Ford_GT40_MK2_LeMans_a.jpg",
            //         price: 23000.00,
            //         name: 'Shelby Ford GT40 MK II LeMans '),
            //     WishListCard(
            //       img:
            //           "https://www.scalemodelcart.com/usrfile/40002-18_CMR175_Mazda_787B_LeMans_Gachot_a.jpg",
            //       name: "Mazda 787B LeMans",
            //       price: 9855.00,
            //     ),
            //     WishListCard(
            //         img:
            //             "https://www.scalemodelcart.com/usrfile/40011-18_AM_Vulcan_a.jpeg",
            //         price: 12000.0,
            //         name: 'Aston Martin Valcun'),
            //     WishListCard(
            //         img:
            //             "https://www.scalemodelcart.com/usrfile/40002-18_Norev183497_Mb_AMG_GT_S_a.jpg",
            //         price: 8655.0,
            //         name: 'Mercedes Benz AMG GT-S'),
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
              color: Colors.black,
            ),
            onPressed: () {
              setState(() {
                Navigator.pop(context);
              });
            },
          ),
          Text(
            "WISHLIST",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w500, color: Colors.black),
            textScaleFactor: 1,
          ),
          IconButton(
            icon: Icon(
              Icons.shopping_bag_outlined,
              color: Colors.black,
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
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Home()));
                    });
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:scale_model_cart/Screens/Cartpage/CartCard.dart';

import 'package:scale_model_cart/Screens/Cartpage/Payment/finalmain.dart';

import 'package:scale_model_cart/Screens/WishList/WishList.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
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
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            // emptyCart()
            CartCard(
                img:
                    "https://www.scalemodelcart.com/usrfile/40002-18_Norev_Mercedes_Maybach_S_650_a.jpg",
                price: 13880.00,
                name: 'Mercedes Maybach S 650'),
            CartCard(
                img:
                    "https://www.scalemodelcart.com/usrfile/40002-18_Solido_S1803004_Ford_GT40_a.jpg",
                price: 7880.00,
                name: 'Ford GT40'),
            CartCard(
                img:
                    "https://www.scalemodelcart.com/usrfile/40002-18_Shelby_Ford_GT40_MK2_LeMans_a.jpg",
                price: 23000.00,
                name: 'Shelby Ford GT40 MK II LeMans '),
            // CartCard(
            //   img:
            //       "https://www.scalemodelcart.com/usrfile/40002-18_CMR175_Mazda_787B_LeMans_Gachot_a.jpg",
            //   name: "Mazda 787B LeMans",
            //   price: 9855.00,
            // ),
            // CartCard(
            //     img:
            //         "https://www.scalemodelcart.com/usrfile/40011-18_AM_Vulcan_a.jpeg",
            //     price: 12000.0,
            //     name: 'Aston Martin Valcun'),
            // CartCard(
            //     img:
            //         "https://www.scalemodelcart.com/usrfile/40002-18_Norev183497_Mb_AMG_GT_S_a.jpg",
            //     price: 8655.0,
            //     name: 'Mercedes Benz AMG GT-S'),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            priceDetails(55040, 2500, 52090),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            )
          ],
        )),
        floatingActionButton: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          child: FloatingActionButton.extended(
            elevation: 0,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PaymentMain()));
            },
            icon: Icon(Icons.shopping_cart_outlined),
            backgroundColor: Colors.black,
            foregroundColor: Colors.white,
            label: Text(
              "PLACE ORDER",
              style: TextStyle(fontSize: 15),
              textScaleFactor: 1,
            ),
          ),
        ),
      ),
    );
  }

  Widget appbar() {
    return Container(
      color: Colors.transparent,
      height: MediaQuery.of(context).size.height * 0.06,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 0),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.05,
            child: Row(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Container(
                    height: MediaQuery.of(context).size.height * 0.05,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'MY CART',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                          textScaleFactor: 1,
                        )
                      ],
                    ))
              ],
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.favorite,
              color: Colors.black,
            ),
            onPressed: () {
              setState(() {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => WishList()));
              });
            },
          ),
        ]),
      ),
    );
  }

  Widget priceDetails(double price, double discount, double total) {
    return Container(
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.05,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 0.1),
                borderRadius: BorderRadius.all(Radius.circular(0)),
                color: Colors.white),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'PRICE DETAILS',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[700]),
                    textScaleFactor: 1,
                  ),
                ),
              ],
            ),
          ),
          Container(
            // height: MediaQuery.of(context).size.height * 0.2,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 0.1),
                borderRadius: BorderRadius.all(Radius.circular(0)),
                color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'PRICE (3 items)',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                        textScaleFactor: 1,
                      ),
                      Text(
                        "₹ " + price.toString(),
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                        textScaleFactor: 1,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'YOU SAVE',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                        textScaleFactor: 1,
                      ),
                      Text(
                        "₹ " + discount.toString(),
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                        textScaleFactor: 1,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'SHIPPING CHARGES',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                        textScaleFactor: 1,
                      ),
                      Text(
                        "₹ 0",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                        textScaleFactor: 1,
                      ),
                    ],
                  ),
                  Divider(thickness: 2, color: Color(0xffE58714)),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'TOTAL',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                          textScaleFactor: 1,
                        ),
                        Text(
                          "₹ " + total.toString(),
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                          textScaleFactor: 1,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget emptyCart() {
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
              Image.asset("assets/images/emptycart.png"),
              // Text(
              //   "Your Wishlist is Empty",
              //   style: TextStyle(
              //       fontSize: 32,
              //       fontWeight: FontWeight.w500,
              //       color: Colors.black),
              //   textScaleFactor: 1,
              // ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Text(
                "Looks like you haven't added anything to your Cart yet",
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
                    "SHOP NOW",
                    style: TextStyle(color: Colors.black),
                  ),
                  onPressed: () {
                    setState(() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PaymentMain()));
                    });
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

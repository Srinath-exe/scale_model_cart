import 'package:flutter/material.dart';
import 'package:page_route_transition/page_route_transition.dart';
import 'package:scale_model_cart/Models/product_model.dart';
import 'package:scale_model_cart/Screens/Cartpage/CartCard.dart';

import 'package:scale_model_cart/Screens/Cartpage/Payment/finalmain.dart';

import 'package:scale_model_cart/Screens/WishList/WishList.dart';
import 'package:scale_model_cart/constants/constants.dart';

import '../../widgets/buttons.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
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
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            // emptyCart(),
            Column(
              children: List.generate(
                3,
                (index) => CartCard(
                    car: cars[index],
                    img: cars[index].img[0],
                    price: cars[index].price,
                    name: cars[index].name),
              ),
            ),

            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            priceDetails(context),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            )
          ],
        )),
      ),
      floatingActionButton: ThemeButton(
        onTap: () {
          setState(() {
            Navigator.push(
                context,
                PageRouteTransitionBuilder(
                    page: PaymentMain(),
                    curve: Curves.easeOut,
                    duration: Duration(milliseconds: 600),
                    effect: TransitionEffect.bottomToTop));
          });
        },
        text: "",
        borderRadius: 22,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Icon(
                  Icons.shopping_bag_rounded,
                  color: secondary,
                  size: 20,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Check Out",
                  style: TextStyle(
                      fontSize: 18,
                      color: secondary,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
            Text(
              "\$ 1280",
              style: TextStyle(
                  color: secondary, fontSize: 20, fontWeight: FontWeight.w500),
            ),
          ]),
        ),
        bgColor: accent,
        txtColor: secondary,
        padding: 0,
        height: 60,
        width: GetSize().width(context) * 0.92,
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
                    color: light,
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
                          'My Cart',
                          style: TextStyle(
                              color: light,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
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
              color: accent,
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

Widget priceDetails(BuildContext context, {bool? dark}) {
  dark == null ? dark = false : null;
  return Container(
    width: MediaQuery.of(context).size.width * 0.95,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(0)),
    ),
    child: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Subtotal',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: dark
                        ? secondary.withOpacity(0.6)
                        : light.withOpacity(0.6)),
                textScaleFactor: 1,
              ),
              Text(
                "\$ 1270",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: dark ? secondary : light),
                textScaleFactor: 1,
              ),
            ],
          ),
          SizedBox(
            height: GetSize().height(context) * 0.02,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Delivery Charges',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: dark
                        ? secondary.withOpacity(0.6)
                        : light.withOpacity(0.6)),
                textScaleFactor: 1,
              ),
              Text(
                "\$ 10",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: dark ? secondary : light),
                textScaleFactor: 1,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Divider(thickness: 2, color: accent),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: dark
                        ? secondary.withOpacity(0.6)
                        : light.withOpacity(0.6)),
                textScaleFactor: 1,
              ),
              Text(
                "\$ 1280",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: dark ? secondary : light),
                textScaleFactor: 1,
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

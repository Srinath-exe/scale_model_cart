import 'dart:math';

import 'package:flutter/material.dart';
import 'package:page_route_transition/page_route_transition.dart';
import 'package:scale_model_cart/Models/tempPrdModel.dart';
import 'package:scale_model_cart/Screens/HomePage/main_screen.dart';
import 'package:scale_model_cart/Screens/ProductViewpage/ProductPage.dart';
import 'package:scale_model_cart/Screens/ProductViewpage/prod_image_page.dart';
import 'package:scale_model_cart/widgets/buttons.dart';
import 'package:scale_model_cart/widgets/productCard.dart';

import '../../Models/product_model.dart';
import '../../constants/constants.dart';
import '../../widgets/back_button.dart';
import '../../widgets/productImage.dart';
import '../HomePage/productPage.dart';

class ProductScreen extends StatefulWidget {
  Car car;
  ProductScreen({super.key, required this.car});

  @override
  State<ProductScreen> createState() => ProductScreenState();
}

class ProductScreenState extends State<ProductScreen> {
  // ScrollController controller = new ScrollController();
  PageController indicatorcontroller = new PageController();
  double currentPageValue = 0;
  PageController controller = new PageController(viewportFraction: 0.9);
  int _curr = 0;
  bool fav = false;
  bool cart = false;
  @override
  void initState() {
    controller.addListener(() {
      // print("position ${controller.offset}");
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondary,
      floatingActionButton: ThemeButton(
        text: "",
        onTap: () {
          setState(() {
            Navigator.push(
                context,
                PageRouteTransitionBuilder(
                    page: MainScreen(
                      selectedIndex: 3,
                    ),
                    curve: Curves.easeOut,
                    duration: Duration(milliseconds: 600),
                    effect: TransitionEffect.bottomToTop));
          });
        },
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
                  "Add ",
                  style: TextStyle(
                      fontSize: 18,
                      color: secondary,
                      fontWeight: FontWeight.w400),
                ),
                Text(
                  "to ",
                  style: TextStyle(
                      fontSize: 15,
                      color: secondary,
                      fontWeight: FontWeight.w400),
                ),
                Text("Cart",
                    style: TextStyle(
                        fontSize: 18,
                        color: secondary,
                        fontWeight: FontWeight.w400)),
              ],
            ),
            Text(
              "\$ " + widget.car.price.toString(),
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
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Column(
          children: [
            Stack(
              children: [
                Positioned(
                  top: 40,
                  left: 2,
                  child: Container(
                    // height: GetSize().height(context) * 0.32,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomBackButton(
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                        ThemeButton(
                          text: "text",
                          onTap: () {
                            setState(() {
                              fav = !fav;
                            });
                          },
                          elevation: 10,
                          child: fav
                              ? Icon(
                                  Icons.favorite_rounded,
                                  color: Colors.pink,
                                )
                              : Icon(Icons.heart_broken_rounded),
                          width: 55,
                        ),
                        ThemeButton(
                          elevation: 10,
                          onTap: () {
                            setState(() {
                              cart = !cart;
                            });
                          },
                          text: "text",
                          child: cart
                              ? Icon(
                                  Icons.add_shopping_cart_rounded,
                                  color: Colors.green,
                                )
                              : Icon(Icons.add_shopping_cart_rounded,
                                  color: light),
                          width: 55,
                        ),
                        ThemeButton(
                          text: "text",
                          height: 65,
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                              ),
                              Text(widget.car.rating.toString())
                            ],
                          ),
                          width: 55,
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          PageRouteBuilder(
                            transitionDuration: Duration(milliseconds: 1000),
                            pageBuilder: (BuildContext context,
                                Animation<double> animation,
                                Animation<double> secondaryAnimation) {
                              return ImagesScreen(
                                car: widget.car,
                                index: _curr,
                              );
                            },
                            transitionsBuilder: (BuildContext context,
                                Animation<double> animation,
                                Animation<double> secondaryAnimation,
                                Widget child) {
                              return Align(
                                alignment: Alignment.topRight,
                                child: FadeTransition(
                                  opacity: animation,
                                  child: child,
                                ),
                              );
                            },
                          ),
                        );
                      },
                      // onVerticalDragUpdate: (details) {
                      //   int sensitivity = 8;
                      //   if (details.delta.dy > sensitivity) {
                      //     // Down Swipe
                      //     controller.animateTo(controller.offset - 220,
                      //         duration: Duration(milliseconds: 300),
                      //         curve: Curves.easeIn);
                      //     setState(() {
                      //       _curr = (controller.offset / 220).toInt() - 1;
                      //     });
                      //   } else if (details.delta.dy < -sensitivity) {
                      //     // Up Swipe
                      //     controller.animateTo(220 + controller.offset,
                      //         duration: Duration(milliseconds: 300),
                      //         curve: Curves.easeIn);
                      //     setState(() {
                      //       _curr = (controller.offset / 220).toInt() + 1;
                      //     });
                      //   }
                      // },
                      child: Stack(
                        children: [
                          Material(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(120)),
                            elevation: 20,
                            child: Container(
                              clipBehavior: Clip.hardEdge,
                              height: GetSize().height(context) * 0.5,
                              decoration: BoxDecoration(
                                  color: accent,
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(120))),
                              width: GetSize().width(context) * 0.8,
                              child: Container(
                                alignment: Alignment.centerRight,
                                child: PageView.builder(
                                    controller: controller,
                                    itemCount: widget.car.img.length,
                                    onPageChanged: ((value) {
                                      setState(() {
                                        currentPageValue = value.toDouble();
                                      });
                                    }),
                                    scrollDirection: Axis.vertical,
                                    itemBuilder: (context, index) {
                                      // Transform using for animation
                                      return Transform(
                                        transform: Matrix4.identity()
                                          ..rotateY(currentPageValue - index),
                                        child:
                                            image(index, widget.car.img[index]),
                                      );
                                    }),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 40,
                            left: 0,
                            child: Column(
                              children: List.generate(
                                  widget.car.img.length,
                                  (index) => indicator(
                                      currentPageValue == (index)
                                          ? true
                                          : false)),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Positioned(
                  right: 40,
                  bottom: 20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "\$ " + widget.car.price.toString(),
                        style: TextStyle(
                            color: secondary,
                            fontSize: 42,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "Price",
                        style: TextStyle(
                            color: secondary.withOpacity(0.5),
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 30,
                  right: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(
                      children: [
                        Transform.rotate(
                          angle: 2,
                          child: Icon(
                            Icons.local_offer,
                            size: 80,
                            color: light.withOpacity(0.5),
                          ),
                        ),
                        Positioned(
                          top: 25,
                          right: 30,
                          child: Transform.rotate(
                              angle: -0.34,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    "15%",
                                    style: TextStyle(
                                        color: secondary,
                                        fontSize: 16,
                                        letterSpacing: 1,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    "off",
                                    style: TextStyle(
                                        color: secondary,
                                        fontSize: 12,
                                        letterSpacing: 1,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              )),
                        ),
                      ],
                    ),
                  ),
                )
                // Positioned(
                //     top: 20,
                //     right: 30,
                //     child: Transform.rotate(
                //       angle: 1,
                //       child: Container(
                //         width: GetSize().width(context) * 0.3,
                //         child: Image.asset("assets/images/offer.png"),
                //       ),
                //     )),
                // Positioned(
                //     top: 65,
                //     right: 55,
                //     child: Container(
                //       alignment: Alignment.center,
                //       child: Text(
                //         "15% off",
                //         style: TextStyle(
                //             color: light,
                //             fontSize: 16,
                //             letterSpacing: 1,
                //             fontWeight: FontWeight.w600),
                //       ),
                //     ))
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Text(
                      widget.car.name,
                      style: TextStyle(
                          color: light,
                          fontSize: 24,
                          fontWeight: FontWeight.w500),
                      textScaleFactor: 1,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    "Scale -" + widget.car.scale,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[400]),
                    textScaleFactor: 1,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    widget.car.details,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey[400]),
                    textScaleFactor: 1,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Specifications(),
                  Prod_details(),
                  Highlights(),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "Latest",
                              style: TextStyle(
                                  color: light.withOpacity(0.8),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500),
                              textScaleFactor: 1,
                            ),
                          ],
                        ),
                        nice()
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 200,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  indicator(bool active) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: AnimatedContainer(
          curve: Curves.easeIn,
          duration: Duration(milliseconds: 500),
          height: active
              ? ((GetSize().height(context) * 0.2) / widget.car.img.length) * 2
              : (GetSize().height(context) * 0.1) / widget.car.img.length,
          width: active ? 3 : 2,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: active ? secondary : light),
        ));
  }

  Widget image(int index, String url) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        alignment: Alignment.centerRight,
        height: GetSize().height(context) * 0.3,
        width: GetSize().height(context) * 0.3,
        child: Hero(tag: index, child: Image.asset(url)),
      ),
    );
  }
}

//  Material(
//                             borderRadius: BorderRadius.only(
//                                 bottomLeft: Radius.circular(120)),
//                             elevation: 20,
//                             child: Container(
//                               clipBehavior: Clip.hardEdge,
//                               height: GetSize().height(context) * 0.5,
//                               decoration: BoxDecoration(
//                                   color: accent,
//                                   borderRadius: BorderRadius.only(
//                                       bottomLeft: Radius.circular(120))),
//                               width: GetSize().width(context) * 0.8,
//                               child: Container(
//                                 child: ListWheelScrollView(
//                                   controller: controller,
//                                   physics: NeverScrollableScrollPhysics(),
//                                   diameterRatio: 2,
//                                   itemExtent: 220,
//                                   offAxisFraction: -1,
//                                   overAndUnderCenterOpacity: 1,
//                                   squeeze: 0.65,
//                                   children: List.generate(widget.car.img.length,
//                                           (index) => index)
//                                       .map((index) =>
//                                           image(index, widget.car.img[index]))
//                                       .toList(),
//                                 ),
//                               ),
//                             ),
//                           ),
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:scale_model_cart/Models/tempPrdModel.dart';
import 'package:scale_model_cart/Screens/ProductViewpage/ProductPage.dart';
import 'package:scale_model_cart/widgets/buttons.dart';

import '../../constants/constants.dart';
import '../../widgets/back_button.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => ProductScreenState();
}

class ProductScreenState extends State<ProductScreen> {
  ScrollController controller = new ScrollController();
  PageController indicatorcontroller = new PageController();
  Product p1 = Product(
      name: "Fiat 131 Panorama - Alitalia",
      price: 28800,
      img: [
        "assets/images/image_01.png",
        "assets/images/image_02.png",
        "assets/images/image_03.png",
        "assets/images/image_04.png",
      ],
      details:
          "Named as 'GT' or Grand Touring car, the Ford made GT 40 were produced in the UK and was based on the British made Lola MK6 model with inputs from John Wyer Automotive Engineering, Shelby and a gearbox supplier called Kar-Kraft Powered by Ford made 289 cubic inch V8 engines, about 100 cars rolled out as Ford GT 40 in Mark I, II and Mark III variants. The reason why it was called 40 was because of the height of her windshield which was 40 inches.On 15th June, 1969 at the Circuit de la Sarthe during Le Mans, a Ford GT40 MK I entered by J. W. Automotive Engineering Ltd. and driven by Belgian Jacky Ickx and British Jack Oliver came first after doing 372 laps maintaining an average speed of 208 km/hr");

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
      backgroundColor: primaryDark,
      floatingActionButton: ThemeButton(
        text: "",
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              "Add to Cart",
              style: TextStyle(fontSize: 18, color: secondary),
            ),
            Icon(
              Icons.shopping_bag_rounded,
              color: secondary,
              size: 24,
            )
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
                    height: GetSize().height(context) * 0.32,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomBackButton(
                          onTap: () {},
                        ),
                        ThemeButton(
                          text: "text",
                          onTap: () {
                            setState(() {
                              fav = !fav;
                            });
                          },
                          child: fav
                              ? Icon(
                                  Icons.favorite_rounded,
                                  color: Colors.pink,
                                )
                              : Icon(Icons.heart_broken_rounded),
                          width: 55,
                        ),
                        ThemeButton(
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
                              : Icon(
                                  Icons.add_shopping_cart_rounded,
                                  color: Colors.white,
                                ),
                          width: 55,
                        )
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onVerticalDragUpdate: (details) {
                        int sensitivity = 8;
                        if (details.delta.dy > sensitivity) {
                          // Down Swipe
                          controller.animateTo(controller.offset - 220,
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeIn);
                          setState(() {
                            _curr = (controller.offset / 220).toInt() - 1;
                          });
                        } else if (details.delta.dy < -sensitivity) {
                          // Up Swipe
                          controller.animateTo(220 + controller.offset,
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeIn);
                          setState(() {
                            _curr = (controller.offset / 220).toInt() + 1;
                          });
                        }
                      },
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
                                child: ListWheelScrollView(
                                  controller: controller,
                                  physics: NeverScrollableScrollPhysics(),
                                  diameterRatio: 2,
                                  itemExtent: 220,
                                  offAxisFraction: -1,
                                  overAndUnderCenterOpacity: 1,
                                  squeeze: 0.65,
                                  children: List.generate(
                                          p1.img.length, (index) => index)
                                      .map((index) => image(p1.img[index]))
                                      .toList(),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 40,
                            left: 0,
                            child: Column(
                              children: List.generate(
                                  4,
                                  (index) => indicator(
                                      _curr == (index) ? true : false)),
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
                          "\$ 1,500",
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
                    )),
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
                      "FORD GT40 MKI - LE MANS - WINNER",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w500),
                      textScaleFactor: 1,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    "Scale - 1:18",
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
                    p1.details,
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
        height: active ? 70 : 40,
        width: active ? 3 : 2,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: active ? secondary : Colors.white),
      ),
    );
  }

  Widget image(String url) {
    return Container(
      height: GetSize().height(context) * 0.3,
      width: GetSize().height(context) * 0.3,
      child: Image.asset(url),
    );
  }
}
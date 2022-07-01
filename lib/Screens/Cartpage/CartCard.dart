import 'package:flutter/material.dart';
import 'package:flutter_number_picker/flutter_number_picker.dart';
import 'package:page_route_transition/page_route_transition.dart';
import 'package:scale_model_cart/Models/product_model.dart';

import 'package:scale_model_cart/Screens/ProductViewpage/ProductPage.dart';
import 'package:scale_model_cart/constants/constants.dart';

import '../../widgets/buttons.dart';
import '../HomePage/productPage.dart';
import '../ProductViewpage/product_detail_view.dart';

class CartCard extends StatefulWidget {
  Car car;
  String img;
  double price;
  String name;
  CartCard(
      {Key? key,
      required this.car,
      required this.img,
      required this.name,
      required this.price})
      : super(key: key);

  @override
  _CartCardState createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
  int value = 1;
  bool fav = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Dismissible(
        key: ValueKey(widget.price),
        background: Container(
          color: secondary,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Icon(Icons.delete, color: accent, size: 30),
              ),
            ],
          ),
        ),
        child: GestureDetector(
          onTap: () {
            setState(() {
              Navigator.push(
                  context,
                  PageRouteTransitionBuilder(
                      page: ProductScreen(
                        car: widget.car,
                      ),
                      curve: Curves.easeOut,
                      duration: Duration(milliseconds: 600),
                      effect: TransitionEffect.topToBottom));
            });
          },
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 0.1),
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: secondaryLight),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      color: Colors.grey[10],
                      width: MediaQuery.of(context).size.width * 0.51,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.45,
                            child: Text(
                              widget.name,
                              style: TextStyle(
                                  color: light,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500),
                              textScaleFactor: 1,
                            ),
                          ),
                          SizedBox(
                            height: GetSize().height(context) * 0.02,
                          ),
                          Row(
                            children: [
                              ThemeButton(
                                text: "text",
                                onTap: () {
                                  setState(() {
                                    fav = !fav;
                                  });
                                },
                                elevation: 10,
                                padding: 0,
                                child: fav
                                    ? Icon(
                                        Icons.favorite_rounded,
                                        color: Colors.pink,
                                        size: 20,
                                      )
                                    : Icon(
                                        Icons.favorite_rounded,
                                        size: 20,
                                      ),
                                height: 35,
                                width: 55,
                              ),
                              SizedBox(
                                width: GetSize().width(context) * 0.05,
                              ),
                              Container(
                                  width: GetSize().width(context) * 0.23,
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      color: Colors.grey[100],
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            value++;
                                          });
                                        },
                                        child: Icon(
                                          Icons.add,
                                          size: 17,
                                        ),
                                      ),
                                      Text(value.toString()),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            value--;
                                          });
                                        },
                                        child: Icon(
                                          Icons.remove,
                                          size: 17,
                                        ),
                                      ),
                                    ],
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.2,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color: secondaryLight),
                            child: img(widget.img),
                          ),
                          SizedBox(
                            height: GetSize().height(context) * 0.005,
                          ),
                          Row(
                            children: [
                              Text(
                                '\$ ' + widget.price.toString(),
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: light),
                                textScaleFactor: 1,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget img(String img) {
    return Container(
        width: GetSize().width(context) * 0.2,
        child: Image.asset(img, fit: BoxFit.fill));
  }
}

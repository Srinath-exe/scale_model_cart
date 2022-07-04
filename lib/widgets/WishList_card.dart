import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:scale_model_cart/constants/constants.dart';
import 'package:scale_model_cart/widgets/toastmsg.dart';

class WishListCard extends StatefulWidget {
  String img;
  double price;
  String name;
  WishListCard({required this.img, required this.name, required this.price});

  @override
  _WishListCardState createState() => _WishListCardState();
}

class _WishListCardState extends State<WishListCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Dismissible(
        key: ValueKey(widget.price),
        background: Container(
          color: secondaryLight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Icon(Icons.delete, color: accent, size: 40),
                  )
                ],
              ),
            ],
          ),
        ),
        child: Container(
          padding: const EdgeInsets.all(8.0),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: secondary),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    color: Colors.transparent,
                    width: MediaQuery.of(context).size.width * 0.49,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  color: Colors.transparent,
                                  width:
                                      MediaQuery.of(context).size.width * 0.46,
                                  child: Text(
                                    widget.name,
                                    style: TextStyle(
                                        fontSize: 13,
                                        color: light,
                                        fontWeight: FontWeight.w500),
                                    textScaleFactor: 1,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.width * 0.03,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  child: TextButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: secondaryLight,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        onPrimary: accent, // foreground
                                      ),
                                      child: Stack(
                                        children: [
                                          Icon(
                                            Icons.add_shopping_cart_sharp,
                                            color: accent,
                                          ),
                                        ],
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          msg().toast("Added to Cart");
                                        });
                                      }),
                                ),
                                SizedBox(
                                  width: GetSize().width(context) * 0.1,
                                ),
                                Text(
                                  '\$ ' + widget.price.toString(),
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: light),
                                  textScaleFactor: 1,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.14,
                    width: MediaQuery.of(context).size.width * 0.38,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.transparent),
                    child: img(widget.img),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget img(String img) {
    return Image.asset(img, fit: BoxFit.fill);
  }
}

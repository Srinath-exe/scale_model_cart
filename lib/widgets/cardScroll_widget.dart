import 'dart:math';

import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:scale_model_cart/Models/tempPrdModel.dart';
import 'package:scale_model_cart/Screens/ProductViewpage/ProductPage.dart';

import '../Screens/HomePage/productPage.dart';

class CardScrollWidget extends StatefulWidget {
  List<Product> products;

  CardScrollWidget({required this.products});

  @override
  _CardScrollWidgetState createState() => _CardScrollWidgetState();
}

class _CardScrollWidgetState extends State<CardScrollWidget> {
  var padding = 20.0;
  bool add = false;
  var verticalInset = 20.0;
  var cardAspectRatio;
  var widgetAspectRatio;
  var currentPage;
  @override
  void initState() {
    currentPage = widget.products.length - 1.0;
    cardAspectRatio = 12.0 / 15.0;
    widgetAspectRatio = cardAspectRatio * 1.2;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    PageController controller =
        PageController(initialPage: widget.products.length - 1);
    controller.addListener(() {
      setState(() {
        currentPage = controller.page!;
      });
    });
    return new AspectRatio(
      aspectRatio: widgetAspectRatio,
      child: LayoutBuilder(builder: (context, contraints) {
        var width = contraints.maxWidth;
        var height = contraints.maxHeight;

        var safeWidth = width - 2 * padding;
        var safeHeight = height - 2 * padding;

        var heightOfPrimaryCard = safeHeight;
        var widthOfPrimaryCard = heightOfPrimaryCard * cardAspectRatio;

        var primaryCardLeft = safeWidth - widthOfPrimaryCard;
        var horizontalInset = primaryCardLeft / 2;

        List<Widget> cardList = [];
        List<Color> colors = [
          Colors.black,
          Colors.blue,
          Colors.pinkAccent,
          Colors.pinkAccent
        ];

        for (var i = 0; i < widget.products.length; i++) {
          var delta = i - currentPage;
          bool isOnRight = delta > 0;

          var start = padding +
              max(
                  primaryCardLeft -
                      horizontalInset * -delta * (isOnRight ? 15 : 1),
                  0.0);

          var cardItem = Positioned.directional(
            top: padding + verticalInset * max(-delta, 0.0),
            bottom: padding + verticalInset * max(-delta, 0.0),
            start: start,
            textDirection: TextDirection.rtl,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(14.0),
              child: GestureDetector(
                onTap: () {
                  controller.nextPage(
                      duration: Duration(
                        seconds: 5,
                      ),
                      curve: Curves.bounceIn);
                },
                child: Container(
                  color: Colors.white,
                  child: Container(
                    decoration: BoxDecoration(color: Colors.white, boxShadow: [
                      BoxShadow(
                          color: Colors.black12,
                          offset: Offset(3.0, 6.0),
                          blurRadius: 10.0)
                    ]),
                    child: AspectRatio(
                      aspectRatio: cardAspectRatio,
                      child: Column(
                        // fit: StackFit.expand,
                        children: <Widget>[
                          ShaderMask(
                            shaderCallback: (rect) {
                              return LinearGradient(
                                begin: Alignment(0.0, 0.6),
                                end: Alignment.bottomCenter,
                                colors: [Colors.white, Colors.transparent],
                              ).createShader(
                                  Rect.fromLTRB(0, 0, rect.width, rect.height));
                            },
                            blendMode: BlendMode.dstATop,
                            child: Image.asset('${widget.products[i].img[0]}',
                                fit: BoxFit.fitWidth),
                          ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 16.0, vertical: 8.0),
                                  child: Text(widget.products[i].name,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20.0,
                                          fontFamily: "SF-Pro-Text-Regular")),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        SizedBox(
                                          height: 10.0,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 12.0, bottom: 12.0),
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 22.0,
                                                vertical: 6.0),
                                            decoration: BoxDecoration(
                                                color: Colors.blueAccent,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        20.0)),
                                            child: Text(
                                              "${widget.products[i].price}",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0),
                                          child: OutlinedButton(
                                              child: Row(
                                                children: [
                                                  Text(
                                                    'See More',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 12),
                                                  ),
                                                  Icon(
                                                    Icons.arrow_forward_ios,
                                                    size: 12,
                                                  )
                                                ],
                                              ),
                                              style: OutlinedButton.styleFrom(
                                                primary: Colors.black,
                                                backgroundColor: Colors.white,
                                                shape:
                                                    const RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    25))),
                                              ),
                                              onPressed: () {
                                                setState(() {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              ProductPage(
                                                          title:
                                                              "New Collection",
                                                        ),
                                                      ));
                                                });
                                              }),
                                        )
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        FavoriteButton(
                                          iconSize: 40,
                                          valueChanged: (_isFavorite) {
                                            _isFavorite = !_isFavorite;
                                            _isFavorite == false
                                                ? Fluttertoast.showToast(
                                                    msg: "Added to Wishlist",
                                                    toastLength:
                                                        Toast.LENGTH_SHORT,
                                                    gravity:
                                                        ToastGravity.BOTTOM,
                                                    timeInSecForIosWeb: 1,
                                                    backgroundColor:
                                                        Colors.grey[100],
                                                    textColor: Colors.white,
                                                    fontSize: 12.0)
                                                : Fluttertoast.showToast(
                                                    msg:
                                                        "Removed from Wishlist",
                                                    toastLength:
                                                        Toast.LENGTH_SHORT,
                                                    gravity:
                                                        ToastGravity.BOTTOM,
                                                    timeInSecForIosWeb: 1,
                                                    backgroundColor:
                                                        Colors.grey[100],
                                                    textColor: Colors.white,
                                                    fontSize: 12.0);
                                          },
                                        ),
                                        IconButton(
                                          icon: add
                                              ? const Icon(
                                                  Icons.add_shopping_cart_sharp,
                                                  color: Colors.orange,
                                                )
                                              : const Icon(
                                                  Icons.add_shopping_cart_sharp,
                                                  color: Colors.black,
                                                ),
                                          onPressed: () {
                                            setState(() {
                                              add = !add;

                                              add == true
                                                  ? Fluttertoast.showToast(
                                                      msg: "Added to Cart",
                                                      toastLength:
                                                          Toast.LENGTH_SHORT,
                                                      gravity:
                                                          ToastGravity.BOTTOM,
                                                      timeInSecForIosWeb: 1,
                                                      backgroundColor:
                                                          Colors.grey[100],
                                                      textColor: Colors.white,
                                                      fontSize: 12.0)
                                                  : Fluttertoast.showToast(
                                                      msg: "Removed from Cart",
                                                      toastLength:
                                                          Toast.LENGTH_SHORT,
                                                      gravity:
                                                          ToastGravity.BOTTOM,
                                                      timeInSecForIosWeb: 1,
                                                      backgroundColor:
                                                          Colors.grey[100],
                                                      textColor: Colors.white,
                                                      fontSize: 12.0);
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
          cardList.add(cardItem);
        }
        return Container(
          height: 50,
          child: Stack(
            children: <Widget>[
              Stack(
                clipBehavior: Clip.hardEdge,
                children: cardList,
              ),
              IgnorePointer(
                child: Positioned.fill(
                  child: PageView.builder(
                    itemCount: widget.products.length,
                    controller: controller,
                    reverse: true,
                    itemBuilder: (context, index) {
                      return Container(
                        color: index % 2 == 0
                            ? Colors.red
                            : Colors.red.withOpacity(0.5),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}

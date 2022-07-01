import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:page_route_transition/page_route_transition.dart';
import 'package:scale_model_cart/Models/product_model.dart';
import 'package:scale_model_cart/Screens/ProductViewpage/ProductPage.dart';
import 'package:scale_model_cart/constants/constants.dart';

import '../ProductViewpage/product_detail_view.dart';

class ProductTile extends StatefulWidget {
  Car car;
  double? scale;

  ProductTile({required this.car, this.scale = 1});

  @override
  _ProductTileState createState() => _ProductTileState();
}

class _ProductTileState extends State<ProductTile> {
  bool _isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: widget.scale == 1
            ? EdgeInsets.all(8)
            : EdgeInsets.symmetric(horizontal: 12.0, vertical: 0),
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
                      effect: TransitionEffect.bottomToTop));
            });
          },
          child: Transform.scale(
            scale: widget.scale,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Material(
                      color: Colors.transparent,
                      elevation: 50,
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        width: GetSize().width(context) * 0.35,
                        height: GetSize().width(context) * 0.35,
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: RadialGradient(
                            center: Alignment(0.2, 0.2),
                            colors: [
                              // Color.fromRGBO(3, 235, 255, 1),
                              // Color.fromRGBO(152, 70, 242, 1),
                              Colors.grey.withOpacity(0.3),
                              Colors.grey.withOpacity(0.2)
                            ],
                            radius: 0.5,
                          ),
                          // color: Colors.grey.withOpacity(0.3)
                        ),
                        alignment: Alignment.bottomRight,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _isFavorite = !_isFavorite;
                            });
                          },
                          child: Container(
                              width: GetSize().width(context) * 0.12,
                              height: GetSize().width(context) * 0.12,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20)),
                                  color: Colors.grey.withOpacity(0.3)),
                              child: AnimatedSwitcher(
                                switchInCurve: Curves.elasticIn,
                                duration: Duration(milliseconds: 1000),
                                child: _isFavorite
                                    ? Icon(
                                        Icons.favorite_rounded,
                                        color: Colors.pink,
                                      )
                                    : Icon(
                                        Icons.favorite_outline_rounded,
                                        color: Colors.grey,
                                      ),
                              )),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 0.0, vertical: 10),
                      child: Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: Text(
                              widget.car.name,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: light.withOpacity(0.7),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500),
                              textScaleFactor: 1,
                            ),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            '\$ ' + widget.car.price.toString(),
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: accent),
                            textScaleFactor: 1,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Positioned(left: -20, top: -20, child: img(widget.car.img[0]))
              ],
            ),
          ),
        ));
  }

  Widget img(String img) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.45,
        // height: MediaQuery.of(context).size.height * 0.14,
        child: Transform.rotate(
          angle: 0,
          child: Hero(
            tag: img,
            child: Image.asset(
              img,
              fit: BoxFit.fill,
            ),
          ),
        ));
  }
}

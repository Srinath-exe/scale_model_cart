import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:scale_model_cart/Screens/ProductViewpage/ProductPage.dart';

import '../Screens/HomePage/productPage.dart';

class ProductCard extends StatefulWidget {
  String imglink;
  String name;
  bool? stock = true;

  double price;
  ProductCard({required this.imglink, required this.name, required this.price});
  //const ProductCard({ Key? key }) : super(key: key) {this.img_link,this.});

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool _isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 3),
      child: Material(
        borderRadius: BorderRadius.circular(10.0),
        child: InkWell(
          enableFeedback: true,
          splashColor: Colors.white,
          onTap: () {
            setState(() {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) =>  ProductPage(
                      title: "New Collection",
                    ),
                  ));
            });
          },
          child: Ink(
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.all(Radius.circular(10))),
            width: MediaQuery.of(context).size.width * 0.4,
            // height: MediaQuery.of(context).size.height * 0.22,
            child: Column(
              children: [
                Container(
                    child: Stack(
                  children: [
                    img(widget.imglink),
                    Positioned(
                      left: 10,
                      top: 10,
                      child: FavoriteButton(
                        iconSize: 30,
                        valueChanged: (_isFavorite) {
                          _isFavorite = !_isFavorite;
                          _isFavorite == false
                              ? Fluttertoast.showToast(
                                  msg: "Added to Wishlist",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.grey[100],
                                  textColor: Colors.white,
                                  fontSize: 12.0)
                              : Fluttertoast.showToast(
                                  msg: "Removed from Wishlist",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.grey[100],
                                  textColor: Colors.white,
                                  fontSize: 12.0);
                        },
                      ),
                    )
                  ],
                )),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 7.0, vertical: 2),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.36,
                            child: Text(
                              widget.name,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                              textScaleFactor: 1,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '₹ ' + widget.price.toString(),
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Colors.black),
                            textScaleFactor: 1,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget img(String img) {
    return ShaderMask(
        shaderCallback: (rect) {
          return LinearGradient(
            begin: Alignment(0.0, 0.6),
            end: Alignment.bottomCenter,
            colors: [Colors.white, Colors.transparent],
          ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
        },
        blendMode: BlendMode.dstATop,
        child: Container(
            width: MediaQuery.of(context).size.width * 0.40,
            height: MediaQuery.of(context).size.height * 0.14,
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Image.network(
              img,
              fit: BoxFit.fill,
            )));
  }
}

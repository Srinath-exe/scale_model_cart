import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:scale_model_cart/Screens/ProductViewpage/ProductPage.dart';
import 'package:scale_model_cart/constants/constants.dart';

import '../ProductViewpage/product_detail_view.dart';

class ProductTile extends StatefulWidget {
  String imglink;
  String name;

  double price;
  ProductTile({required this.imglink, required this.name, required this.price});

  @override
  _ProductTileState createState() => _ProductTileState();
}

// onTap: () {
//   setState(() {
//     Navigator.push(context,
//         MaterialPageRoute(builder: (context) => ProductScreen()));
//   });
// },
class _ProductTileState extends State<ProductTile> {
  bool _isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
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
                        color: Colors.grey.withOpacity(0.3)),
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 0.0, vertical: 10),
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: Text(
                          widget.name,
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
                        '\$ ' + widget.price.toString(),
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
            Positioned(left: -20, top: -20, child: img(widget.imglink))
          ],
        ));
  }

  Widget img(String img) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.50,
        // height: MediaQuery.of(context).size.height * 0.14,
        child: Transform.rotate(
          angle: -0.21,
          child: Image.asset(
            img,
            fit: BoxFit.fill,
          ),
        ));
  }
}

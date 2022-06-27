import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:scale_model_cart/Screens/Category/categoryPage.dart';
import 'package:scale_model_cart/Screens/HomePage/product_Tile.dart';
import 'package:scale_model_cart/constants/constants.dart';

import 'package:simple_speed_dial/simple_speed_dial.dart';

class ProductPage extends StatefulWidget {
  String title;
  ProductPage({Key? key, required this.title}) : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  String _text = '';
  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: secondary,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: secondary,
          floatingActionButton: SpeedDial(
            child: Icon(Icons.sort),
            speedDialChildren: <SpeedDialChild>[
              SpeedDialChild(
                child: const Icon(Icons.loupe),
                foregroundColor: Colors.white,
                backgroundColor: Colors.red,
                label: 'Newest First',
                onPressed: () {
                  setState(() {
                    _text = 'You pressed \"Let\'s start a run!\"';
                  });
                },
              ),
              SpeedDialChild(
                child: const Icon(Icons.swap_vert),
                foregroundColor: Colors.black,
                backgroundColor: Colors.yellow,
                label: 'Price: Low to High',
                onPressed: () {
                  setState(() {
                    _text = 'You pressed \"Let\'s go for a walk!\"';
                  });
                },
              ),
              SpeedDialChild(
                child: const Icon(Icons.swap_vert_sharp),
                foregroundColor: Colors.white,
                backgroundColor: Colors.green,
                label: 'Price: High to Low',
                onPressed: () {
                  setState(() {
                    _text = 'You pressed \"Let\'s go cycling!\"';
                  });
                },
              ),
            ],
            closedForegroundColor: Colors.black,
            openForegroundColor: Colors.white,
            closedBackgroundColor: Colors.white,
            openBackgroundColor: Colors.black,
          ),
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(top: 18, left: 18, right: 18),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.title,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 26.0,
                            fontFamily: "Calibre-Semibold",
                            fontWeight: FontWeight.w500),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CategoryPage()));
                          });
                        },
                        child: Container(
                          width: GetSize().width(context) * 0.07,
                          child: Image.asset("assets/images/menu.png"),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          ProductTile(
                            imglink: "assets/images/image_01.png",
                            name: "Mercedes Maybach S 650",
                            price: 13880.00,
                          ),
                          ProductTile(
                            imglink: "assets/images/image_02.png",
                            name: "Ford GT40",
                            price: 7880.00,
                          ),
                          ProductTile(
                            imglink: "assets/images/image_01.png",
                            name: "Mercedes Maybach S 650",
                            price: 13880.00,
                          ),
                          ProductTile(
                            imglink: "assets/images/image_08.png",
                            name: "Ford GT40",
                            price: 7880.00,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 50,
                          ),
                          ProductTile(
                            imglink: "assets/images/image_09.png",
                            name: "Ford GT40",
                            price: 7880.00,
                          ),
                          ProductTile(
                            imglink: "assets/images/image_02.png",
                            name: "Ford GT40",
                            price: 7880.00,
                          ),
                          ProductTile(
                            imglink: "assets/images/image_10.png",
                            name: "Mercedes Maybach S 650",
                            price: 13880.00,
                          ),
                          ProductTile(
                            imglink: "assets/images/image_02.png",
                            name: "Ford GT40",
                            price: 7880.00,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  cat() {
    return Container(
        child: Row(
      children: [],
    ));
  }
}

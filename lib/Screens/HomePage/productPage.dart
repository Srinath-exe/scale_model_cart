import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:scale_model_cart/Models/product_model.dart';
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
                    height: 12,
                  ),
                  cat(),
                  nice()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  cat() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: GetSize().width(context) * 0.6,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ac("Sports Car", active: true),
                    ac("SUV"),
                    ac("Bikes"),
                    ac("SUV"),
                    ac("Bikes")
                  ],
                ),
              ),
            ),
            search()
          ],
        ),
      ),
    );
  }

  ac(String text, {bool? active}) {
    active == null ? active = false : null;
    return Padding(
      padding: const EdgeInsets.only(right: 12.0),
      child: ActionChip(
          backgroundColor: active ? light : secondary.withOpacity(0.9),
          label: Text(
            text,
            style:
                TextStyle(color: !active ? light.withOpacity(0.7) : secondary),
          ),
          onPressed: () {}),
    );
  }

  search() {
    return Material(
      elevation: 50,
      borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(10),
          topLeft: Radius.circular(10),
          bottomLeft: Radius.circular(25),
          topRight: Radius.circular(30)),
      color: Colors.grey.withOpacity(0.2),
      child: Container(
        height: 50,
        width: GetSize().width(context) * 0.30,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.search_rounded,
                color: light,
              ),
            ),
            // SizedBox(
            //   width: GetSize().width(context) * 0.01,
            // ),
            Text(
              "Search...",
              style: TextStyle(color: light),
            )
          ],
        ),
      ),
    );
  }
}

niceRow({int? variaton}) {
  variaton == null ? variaton = 0 : null;
  return Column(
    children: [
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(
                cars.length - variaton,
                (index) => ProductTile(
                      car: cars[index + variaton!],
                      scale: 0.8,
                    )).toList()),
      ),
    ],
  );
}

nice() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(
        height: 20,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
              children: List.generate(
                  4,
                  (index) => ProductTile(
                        car: cars[index],
                      )).toList()),
          Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Column(
                  children: List.generate(
                      4,
                      (index) => ProductTile(
                            car: cars[index + 4],
                          )).toList()),
            ],
          ),
        ],
      ),
    ],
  );
}

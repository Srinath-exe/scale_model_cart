import 'package:flutter/material.dart';
import 'package:scale_model_cart/Screens/Category/Categoryproduct.dart';

import 'package:scale_model_cart/constants/constants.dart';

import '../HomePage/productPage.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondary,
      appBar: AppBar(
        // leading: IconButton(
        //   icon: Icon(
        //     Icons.arrow_back_ios_new_rounded,
        //     color: Colors.black,
        //   ),
        //   splashRadius: 20,
        //   splashColor: light,
        //   onPressed: () {
        //     setState(() {
        //       Navigator.push(
        //           context, MaterialPageRoute(builder: (context) => Home()));
        //     });
        //   },
        // ),
        centerTitle: false,
        title: Text(
          "Categories",
          style: TextStyle(
              color: light,
              fontSize: 22.0,
              fontFamily: "Calibre-Semibold",
              letterSpacing: 1.0,
              fontWeight: FontWeight.w500),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  categoryCard('Brand', "assets/images/brands.png", Colors.teal,
                      Colors.green),
                  categoryCard('Size', 'assets/images/brand.png',
                      Colors.orange.shade800, Colors.orange),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  categoryCard('Scale', "assets/images/scale.png",
                      Colors.teal.shade300, Colors.blue),
                  categoryCard('Two Wheeler', 'assets/images/bike.png',
                      Colors.red.shade300, Colors.red.shade600),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  categoryCard(
                    'Sports Car',
                    "assets/images/sports.png",
                    Colors.yellow,
                    Colors.yellow.shade800,
                  ),
                  categoryCard(
                    'Suv',
                    'assets/images/suv.png',
                    Colors.blueGrey.shade200,
                    Colors.blueGrey.shade500,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget categoryCard(
      String title, String imgpath, Color color1, Color color2) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        enableFeedback: true,
        borderRadius: BorderRadius.circular(10.0),
        splashColor: color2,
        onTap: () {
          setState(() {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ProductPage(title: title)));
          });
        },
        child: Ink(
          width: MediaQuery.of(context).size.width * 0.45,
          height: MediaQuery.of(context).size.height * 0.22,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [color1, color2])),
          child: Column(
            children: [
              Container(
                  //color: Colors.blue,
                  height: MediaQuery.of(context).size.height * 0.22 * 0.8,
                  width: MediaQuery.of(context).size.width * 0.45,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        imgpath,
                        fit: BoxFit.contain,
                      ),
                    ],
                  )),
              Text(
                title,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 22.0,
                    fontFamily: "Calibre-Semibold",
                    letterSpacing: 1.0,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

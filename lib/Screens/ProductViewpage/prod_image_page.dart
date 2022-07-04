import 'package:flutter/material.dart';
import 'package:scale_model_cart/Screens/ProductViewpage/product_detail_view.dart';
import 'package:scale_model_cart/constants/constants.dart';
import 'package:scale_model_cart/widgets/buttons.dart';

import '../../Models/product_model.dart';
import '../../Models/tempPrdModel.dart';

class ImagesScreen extends StatefulWidget {
  Car car;
  int index;
  ImagesScreen({Key? key, required this.index, required this.car})
      : super(key: key);

  @override
  State<ImagesScreen> createState() => _ImagesScreenState();
}

class _ImagesScreenState extends State<ImagesScreen> {
  bool fav = false;
  late PageController controller;
  late double currentPageValue;
  @override
  void initState() {
    controller = PageController(initialPage: widget.index);
    currentPageValue = widget.index.toDouble();
    // controller.addListener(() {
    //   setState(() {
    //     currentPageValue = controller.page!;
    //   });
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: accent,
      body: Stack(
        children: [
          Positioned(
              top: 100,
              bottom: 0,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: GetSize().height(context) * 0.2,
                    width: GetSize().width(context),
                    child: Image.asset(
                      "assets/images/base.png",
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ],
              )),
          Center(
            child: PageView.builder(
                onPageChanged: ((value) {
                  setState(() {
                    currentPageValue = value.toDouble();
                  });
                }),
                controller: controller,
                itemCount: widget.car.img.length,
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  // Transform using for animation
                  return Transform(
                    transform: Matrix4.identity()
                      ..rotateZ(currentPageValue - index),
                    child: image(widget.car.img[index]),
                  );
                }),
            // children:
            //     List.generate(widget.product.img.length, (index) => index)
            //         .map((index) => image(widget.product.img[index]))
            //         .toList(),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              // height: 200,
              width: GetSize().width(context),
              child: Image.asset(
                "assets/images/Frame3.png",
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          Positioned(
            right: 15,
            top: 120,
            child: ThemeButton(
              text: "text",
              onTap: () {
                setState(() {
                  fav = !fav;
                });
              },
              elevation: 10,
              child: fav
                  ? Icon(
                      Icons.favorite_rounded,
                      color: Colors.pink,
                    )
                  : Icon(Icons.heart_broken_rounded),
              width: 60,
            ),
          ),
          Positioned(
            top: 70,
            left: 15,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.75,
                  child: Text(
                    widget.car.name,
                    style: TextStyle(
                        color: secondary,
                        fontSize: 24,
                        fontWeight: FontWeight.w500),
                    textScaleFactor: 1,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "Scale -" + widget.car.scale,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: secondary.withOpacity(0.5)),
                  textScaleFactor: 1,
                ),
              ],
            ),
          ),
          Positioned(
              top: 60,
              right: 15,
              child: ThemeButton(
                onTap: () {
                  Navigator.of(context).pop(
                    PageRouteBuilder(
                      transitionDuration: Duration(milliseconds: 1000),
                      pageBuilder: (BuildContext context,
                          Animation<double> animation,
                          Animation<double> secondaryAnimation) {
                        return ProductScreen(
                          car: widget.car,
                        );
                      },
                      transitionsBuilder: (BuildContext context,
                          Animation<double> animation,
                          Animation<double> secondaryAnimation,
                          Widget child) {
                        return Align(
                          alignment: Alignment.topRight,
                          child: FadeTransition(
                            opacity: animation,
                            child: child,
                          ),
                        );
                      },
                    ),
                  );
                },
                text: "",
                width: 60,
                child: Icon(Icons.close),
              )),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Text(
                  "\$ " + widget.car.price.toString(),
                  style: TextStyle(
                      color: accent, fontSize: 32, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                      widget.car.img.length,
                      (index) => indicator(
                          currentPageValue == (index) ? true : false)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  indicator(bool active) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: AnimatedContainer(
        curve: Curves.easeIn,
        duration: Duration(milliseconds: 100),
        height: active ? 3 : 2,
        width: active
            ? ((GetSize().width(context) * 0.5) / widget.car.img.length) * 2
            : (GetSize().width(context) * 0.35) / widget.car.img.length,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: active ? accent : Colors.white),
      ),
    );
  }

  Widget image(String url) {
    return GestureDetector(
      child: Container(
          height: GetSize().height(context) * 0.3,
          width: GetSize().height(context) * 0.3,
          child: Hero(tag: widget.index, child: Image.asset(url))),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:scale_model_cart/Screens/ProductViewpage/product_detail_view.dart';
import 'package:scale_model_cart/constants/constants.dart';
import 'package:scale_model_cart/widgets/buttons.dart';

import '../../Models/tempPrdModel.dart';

class ImagesScreen extends StatefulWidget {
  Product product;
  int index;
  ImagesScreen({Key? key, required this.index, required this.product})
      : super(key: key);

  @override
  State<ImagesScreen> createState() => _ImagesScreenState();
}

class _ImagesScreenState extends State<ImagesScreen> {
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
          Center(
            child: PageView.builder(
                onPageChanged: ((value) {
                  setState(() {
                    currentPageValue = value.toDouble();
                  });
                }),
                controller: controller,
                itemCount: widget.product.img.length,
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  // Transform using for animation
                  return Transform(
                    transform: Matrix4.identity()
                      ..rotateZ(currentPageValue - index),
                    child: image(widget.product.img[index]),
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
              top: 60,
              right: 15,
              child: ThemeButton(
                onTap: () {
                  Navigator.of(context).push(
                    PageRouteBuilder(
                      transitionDuration: Duration(milliseconds: 1000),
                      pageBuilder: (BuildContext context,
                          Animation<double> animation,
                          Animation<double> secondaryAnimation) {
                        return ProductScreen();
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
                  "\$ 1,500",
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
                      widget.product.img.length,
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
        width: active ? 70 : 40,
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

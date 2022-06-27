import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:scale_model_cart/Models/tempPrdModel.dart';

import 'package:scale_model_cart/Screens/ProductViewpage/ProductPage.dart';

import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../Screens/HomePage/productPage.dart';

List<Product> products = [
  Product(
      name: "Fiat 131 Panorama - Alitalia",
      price: 28800,
      img: [
        "assets/images/image_01.jpg",
        "assets/images/image_02.jpg",
        "assets/images/image_03.jpg",
        "assets/images/image_04.jpg",
        "assets/images/image_05.jpg",
      ],
      details:
          "Named as 'GT' or Grand Touring car, the Ford made GT 40 were produced in the UK and was based on the British made Lola MK6 model with inputs from John Wyer Automotive Engineering, Shelby and a gearbox supplier called Kar-Kraft Powered by Ford made 289 cubic inch V8 engines, about 100 cars rolled out as Ford GT 40 in Mark I, II and Mark III variants. The reason why it was called 40 was because of the height of her windshield which was 40 inches.On 15th June, 1969 at the Circuit de la Sarthe during Le Mans, a Ford GT40 MK I entered by J. W. Automotive Engineering Ltd. and driven by Belgian Jacky Ickx and British Jack Oliver came first after doing 372 laps maintaining an average speed of 208 km/hr"),
  Product(
      name: "Mahindra M5 Electro - Formula B - d'Am",
      price: 6999,
      img: ["assets/images/image_08.jpg"],
      details:
          "Named as 'GT' or Grand Touring car, the Ford made GT 40 were produced in the UK and was based on the British made Lola MK6 model with inputs from John Wyer Automotive Engineering, Shelby and a gearbox supplier called Kar-Kraft Powered by Ford made 289 cubic inch V8 engines, about 100 cars rolled out as Ford GT 40 in Mark I, II and Mark III variants. The reason why it was called 40 was because of the height of her windshield which was 40 inches.On 15th June, 1969 at the Circuit de la Sarthe during Le Mans, a Ford GT40 MK I entered by J. W. Automotive Engineering Ltd. and driven by Belgian Jacky Ickx and British Jack Oliver came first after doing 372 laps maintaining an average speed of 208 km/hr"),
  Product(
      name: "lamborghini lm002",
      price: 12999,
      img: ["assets/images/image_09.jpg"],
      details:
          "Named as 'GT' or Grand Touring car, the Ford made GT 40 were produced in the UK and was based on the British made Lola MK6 model with inputs from John Wyer Automotive Engineering, Shelby and a gearbox supplier called Kar-Kraft Powered by Ford made 289 cubic inch V8 engines, about 100 cars rolled out as Ford GT 40 in Mark I, II and Mark III variants. The reason why it was called 40 was because of the height of her windshield which was 40 inches.On 15th June, 1969 at the Circuit de la Sarthe during Le Mans, a Ford GT40 MK I entered by J. W. Automotive Engineering Ltd. and driven by Belgian Jacky Ickx and British Jack Oliver came first after doing 372 laps maintaining an average speed of 208 km/hr"),
  Product(
      name: "koenigsegg regera",
      price: 20860,
      img: ["assets/images/image_10.jpg"],
      details:
          "Named as 'GT' or Grand Touring car, the Ford made GT 40 were produced in the UK and was based on the British made Lola MK6 model with inputs from John Wyer Automotive Engineering, Shelby and a gearbox supplier called Kar-Kraft Powered by Ford made 289 cubic inch V8 engines, about 100 cars rolled out as Ford GT 40 in Mark I, II and Mark III variants. The reason why it was called 40 was because of the height of her windshield which was 40 inches.On 15th June, 1969 at the Circuit de la Sarthe during Le Mans, a Ford GT40 MK I entered by J. W. Automotive Engineering Ltd. and driven by Belgian Jacky Ickx and British Jack Oliver came first after doing 372 laps maintaining an average speed of 208 km/hr")
];

class ProductImage extends StatefulWidget {
  int index;
  ProductImage({required this.index});

  @override
  _ProductImageState createState() => _ProductImageState();
}

class _ProductImageState extends State<ProductImage> {
  late int _currentIndex;
  final ItemScrollController itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();
  @override
  void initState() {
    _currentIndex = widget.index;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                Container(
                  height: MediaQuery.of(context).size.height * 0.1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Center(
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProductPage(
                                      title: "New Collection",
                                    ),
                                  ));
                            });
                          },
                          icon: Icon(
                            Icons.close_outlined,
                            color: Colors.grey,
                          ),
                          iconSize: 50,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              // height: MediaQuery.of(context).size.height,
              // width: MediaQuery.of(context).size.width,
              // child: Dismissible(
              //   direction: DismissDirection.down,
              //   key: Key(products[0].img[1]),
              //   background: Container(
              //     color: Colors.transparent,
              //   ),
              //   onDismissed: (direction) {
              //     setState(() {
              //       Navigator.pop(context);
              //     });
              //   },
              //   child:
              child: CarouselSlider(
                  options: CarouselOptions(
                    //aspectRatio: 0.1,
                    viewportFraction: 1.0,
                    enlargeCenterPage: false,
                    height: MediaQuery.of(context).size.height * 0.35,
                    initialPage: _currentIndex,
                    onPageChanged: (index, reason) {
                      setState(
                        () {
                          _currentIndex = index;
                        },
                      );
                    },
                  ),
                  items: products[0].img.map(
                    (e) {
                      return Container(child: img(e));
                    },
                  ).toList()),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: products[0].img.map((urlOfItem) {
                int index = products[0].img.indexOf(urlOfItem);
                return Container(
                  width: 5.0,
                  height: 5.0,
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentIndex == index
                        ? Color.fromRGBO(0, 0, 0, 0.8)
                        : Color.fromRGBO(0, 0, 0, 0.3),
                  ),
                );
              }).toList(),
            ),
          ],
        ));
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
          child: InteractiveViewer(
              maxScale: 10,
              minScale: 0.8,
              child: Image.asset(img, fit: BoxFit.fill))),
    );
  }
}

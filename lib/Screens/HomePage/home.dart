import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:scale_model_cart/Screens/Category/categoryPage.dart';
import 'package:scale_model_cart/constants/constants.dart';
import 'package:scale_model_cart/widgets/HomeDrawer.dart';
import 'package:scale_model_cart/widgets/card.dart';

import 'data.dart';

final List<String> imagesList = [
  'https://mk0modelkarssdo5tpmi.kinstacdn.com/wp-content/uploads/widebody-1050x788.jpg',
  'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/design-of-a-sculpted-car-with-sculpting-tools-royalty-free-image-1584895346.jpg',
  'https://www.f1authentics.com/images/detailed/17/Category-Banner-1400x500px-MODELS-1.jpg',
  'https://robbreport.com/wp-content/uploads/2020/05/7-2.jpg',
];

class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  var currentPage1 = products.length - 1.0;
  TextEditingController textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF834e7c).withOpacity(1),
      child: Container(
        color: Colors.white,
        child: Container(
          decoration: BoxDecoration(color: primaryDark
              // gradient: LinearGradient(
              //     colors: [primaryDark],
              //     begin: Alignment.bottomCenter,
              //     end: Alignment.topCenter,
              //     tileMode: TileMode.clamp),
              ),
          child: SafeArea(
            child: Scaffold(
              key: _scaffoldKey,
              drawer: HomeDrawer(),
              backgroundColor: Colors.transparent,
              body: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 12.0, right: 12.0, top: 0.0, bottom: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          IconButton(
                            icon: Icon(
                              Icons.menu,
                              color: Colors.white,
                              size: 30.0,
                            ),
                            onPressed: () =>
                                _scaffoldKey.currentState!.openDrawer(),
                          ),
                          Text(
                            "Scale Model Cart",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w400),
                            textScaleFactor: 1,
                          ),
                          IconButton(
                              splashRadius: 20,
                              onPressed: () {},
                              icon: Icon(
                                Icons.search,
                                size: 28,
                                color: Colors.white,
                              ))
                        ],
                      ),
                    ),
                    banner(),
                    catergory(),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("Current Release",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 28.0,
                                  fontFamily: "Calibre-Semibold",
                                  letterSpacing: 1.0,
                                  fontWeight: FontWeight.bold)),
                          // Text("25+ Stories",
                          //     style: TextStyle(color: Colors.blueAccent))
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Row(
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                              color: Color(0xFFff6e6e),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 22.0, vertical: 6.0),
                                child: Text("Latest",
                                    style: TextStyle(color: Colors.white)),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 15.0,
                          ),
                          Text("25+ new",
                              style: TextStyle(color: Colors.blueAccent))
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: HomeCard(
                        products: products,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("Favourite",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 28.0,
                                  fontFamily: "Calibre-Semibold",
                                  letterSpacing: 1.0,
                                  fontWeight: FontWeight.bold)),
                          IconButton(
                            icon: Icon(
                              Icons.sanitizer,
                              size: 12.0,
                              color: Colors.white,
                            ),
                            onPressed: () {},
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: HomeCard(
                        products: products,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget banner() {
    int _currentIndex = 0;
    return Container(
        child: Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            viewportFraction: 0.95,
            pageSnapping: true,
            autoPlay: true,

            // enlargeCenterPage: true,
            //scrollDirection: Axis.vertical,
            onPageChanged: (index, reason) {
              setState(
                () {
                  _currentIndex = index;
                },
              );
            },
          ),
          items: imagesList
              .map((item) => Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Card(
                      margin: EdgeInsets.only(
                        top: 0.0,
                        bottom: 0.0,
                      ),
                      elevation: 6.0,
                      shadowColor: Colors.grey,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                        child: Image.network(
                          item,
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      ))))
              .toList(),
        ),
        Positioned(
          bottom: 10,
          right: 180,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: imagesList.map((urlOfItem) {
              int index = imagesList.indexOf(urlOfItem);
              return Container(
                width: MediaQuery.of(context).size.width * 0.01,
                height: MediaQuery.of(context).size.width * 0.01,
                margin: EdgeInsets.symmetric(vertical: 2.0, horizontal: 2.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentIndex == index ? Colors.grey : Colors.white,
                ),
              );
            }).toList(),
          ),
        )
      ],
    ));
  }

  Widget catergory() {
    return Container(
      // height: MediaQuery.of(context).size.height * 0.2,
      // width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              color: Colors.transparent,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.8),
                        BlendMode
                            .dstATop), //I assumed you want to occupy the entire space of the card
                    image: AssetImage(
                      'assets/images/bg1.png',
                    ),
                  ),
                ),
                child: ListTile(
                  selectedTileColor: Colors.black,
                  tileColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                      side: BorderSide(width: 1, color: Colors.purple)),
                  onTap: () {
                    setState(() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CategoryPage()));
                    });
                  },
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  leading: Container(
                    padding: EdgeInsets.only(right: 12.0),
                    decoration: new BoxDecoration(
                        border: new Border(
                            right: new BorderSide(
                                width: 1.0, color: Colors.white24))),
                    child: Icon(Icons.dashboard, color: Colors.black),
                  ),
                  title: Text(
                    "Categories",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25.0,
                        fontFamily: "Calibre-Semibold",
                        letterSpacing: 1.0,
                        fontWeight: FontWeight.bold),
                  ),
                  trailing: Container(
                    decoration: BoxDecoration(
                      color: Colors.purple,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Icon(Icons.keyboard_arrow_right,
                        color: Colors.white, size: 30.0),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

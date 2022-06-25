import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:scale_model_cart/Screens/Category/categoryPage.dart';
import 'package:scale_model_cart/widgets/productCard.dart';
import 'package:simple_speed_dial/simple_speed_dial.dart';

class CategoryProductPage extends StatefulWidget {
  String title;
  CategoryProductPage({Key? key, required this.title}) : super(key: key);

  @override
  _CategoryProductPageState createState() => _CategoryProductPageState();
}

class _CategoryProductPageState extends State<CategoryProductPage> {
  String _text = '';
  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            primary: false,
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios_new_outlined),
              splashRadius: 20,
              splashColor: Colors.grey,
              onPressed: () {
                setState(() {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CategoryPage()));
                });
              },
            ),
            title: Text(
              widget.title,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 22.0,
                  fontFamily: "Calibre-Semibold",
                  letterSpacing: 1.0,
                  fontWeight: FontWeight.w600),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: AnimSearchBar(
                  closeSearchOnSuffixTap: true,
                  autoFocus: true,
                  width: MediaQuery.of(context).size.width * 0.94,
                  textController: textController,
                  onSuffixTap: () {
                    setState(() {
                      textController.clear();
                    });
                  },
                ),
              ),
            ],
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
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

          //                floatingActionButton: FloatingActionButton.extended(
          //   onPressed: () {

          //   },
          //   label: const Text('Sort'),
          //   icon: const Icon(Icons.sort),
          //   backgroundColor: Colors.pink,
          // ),
          body: SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ProductCard(
                                imglink:
                                    "https://www.scalemodelcart.com/usrfile/40002-18_Norev_Mercedes_Maybach_S_650_a.jpg",
                                name: "Mercedes Maybach S 650",
                                price: 13880.00,
                              ),
                              ProductCard(
                                imglink:
                                    "https://www.scalemodelcart.com/usrfile/40002-18_Solido_S1803004_Ford_GT40_a.jpg",
                                name: "Ford GT40",
                                price: 7880.00,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ProductCard(
                                imglink:
                                    "https://www.scalemodelcart.com/usrfile/40002-18_CMR175_Mazda_787B_LeMans_Gachot_a.jpg",
                                name: "Mazda 787B LeMans",
                                price: 9855.00,
                              ),
                              ProductCard(
                                imglink:
                                    "https://www.scalemodelcart.com/usrfile/40002-18_Shelby_Ford_GT40_MK2_LeMans_a.jpg",
                                name: "Shelby Ford GT40 MK II LeMans ",
                                price: 23000.00,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ProductCard(
                                imglink:
                                    "https://www.scalemodelcart.com/usrfile/40002-18_Norev_Mercedes_Maybach_S_650_a.jpg",
                                name: "Mercedes Maybach S 650",
                                price: 13880.00,
                              ),
                              ProductCard(
                                imglink:
                                    "https://www.scalemodelcart.com/usrfile/40002-18_Solido_S1803004_Ford_GT40_a.jpg",
                                name: "Ford GT40",
                                price: 7880.00,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ProductCard(
                                imglink:
                                    "https://www.scalemodelcart.com/usrfile/40002-18_Norev_Mercedes_Maybach_S_650_a.jpg",
                                name: "Mercedes Maybach S 650",
                                price: 13880.00,
                              ),
                              ProductCard(
                                imglink:
                                    "https://www.scalemodelcart.com/usrfile/40002-18_Solido_S1803004_Ford_GT40_a.jpg",
                                name: "Ford GT40",
                                price: 7880.00,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ProductCard(
                                imglink:
                                    "https://www.scalemodelcart.com/usrfile/40002-18_Norev_Mercedes_Maybach_S_650_a.jpg",
                                name: "Mercedes Maybach S 650",
                                price: 13880.00,
                              ),
                              ProductCard(
                                imglink:
                                    "https://www.scalemodelcart.com/usrfile/40002-18_Solido_S1803004_Ford_GT40_a.jpg",
                                name: "Ford GT40",
                                price: 7880.00,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ProductCard(
                                imglink:
                                    "https://www.scalemodelcart.com/usrfile/40002-18_Norev_Mercedes_Maybach_S_650_a.jpg",
                                name: "Mercedes Maybach S 650",
                                price: 13880.00,
                              ),
                              ProductCard(
                                imglink:
                                    "https://www.scalemodelcart.com/usrfile/40002-18_Solido_S1803004_Ford_GT40_a.jpg",
                                name: "Ford GT40",
                                price: 7880.00,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

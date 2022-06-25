import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


class WishListCard extends StatefulWidget {
  String img;
  double price;
  String name;
  WishListCard({required this.img, required this.name, required this.price});

  @override
  _WishListCardState createState() => _WishListCardState();
}

class _WishListCardState extends State<WishListCard> {
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Dismissible(
        key: ValueKey(widget.price),
        background: Container(

          color:Colors.grey[200],
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                 Padding(
                   padding: const EdgeInsets.all(20.0),
                   child: Icon(Icons.delete,size:40),
                 )
                ],
              ),
            ],
          ),
        ),


            child: Container(
             // height: MediaQuery.of(context).size.height * 0.17,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 0.01),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.white),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal:12.0,vertical: 10),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.14,
                          width: MediaQuery.of(context).size.width * 0.38,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              color: Colors.white),
                          child: img(widget.img),
                        ),
                      ),
                      // SizedBox(
                      //    width: MediaQuery.of(context).size.width * 0.02,
                      // ),
                      Container(
                        color: Colors.transparent,
                       // height: MediaQuery.of(context).size.height * 0.14,
                        width: MediaQuery.of(context).size.width * 0.49,
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        color: Colors.transparent,
                                        width: MediaQuery.of(context).size.width *
                                            0.46,
                                        child: Text(
                                          widget.name,
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500),
                                          textScaleFactor: 1,
                                        ),
                                      ),
                                    ],
                                  ),
                                      SizedBox(
                         height: MediaQuery.of(context).size.width * 0.03,
                      ),
                                  Row(
                                 
                                    children: [
                                      Text(
                                        '₹ ' + widget.price.toString(),
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black),
                                        textScaleFactor: 1,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    height:
                                        MediaQuery.of(context).size.height * 0.035,
                                   // width: MediaQuery.of(context).size.width * 0.26,
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.grey[800], // background
                                          onPrimary: Colors.white, // foreground
                                        ),
                                        child: Text(
                                          "ADD TO CART",
                                          style: TextStyle(fontSize: 10),
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            Fluttertoast.showToast(
                                                msg: "Added to Cart",
                                                toastLength: Toast.LENGTH_SHORT,
                                                gravity: ToastGravity.BOTTOM,
                                                timeInSecForIosWeb: 1,
                                                backgroundColor: Colors.grey[100],
                                                textColor: Colors.white,
                                                fontSize: 12.0);
                                          });
                                        }),
                                  ),
                                  
                                  // SizedBox(
                                  //   width: MediaQuery.of(context).size.width * 0.02,
                                  // ),
                                  // IconButton(
                                  //     onPressed: () {
                                  //       Fluttertoast.showToast(
                                  //           msg: "Removed from Wishlist",
                                  //           toastLength: Toast.LENGTH_SHORT,
                                  //           gravity: ToastGravity.BOTTOM,
                                  //           timeInSecForIosWeb: 1,
                                  //           backgroundColor: Colors.grey[100],
                                  //           textColor: Colors.white,
                                  //           fontSize: 12.0);
                                  //     },
                                  //     icon: Icon(
                                  //       Icons.delete,
                                  //       color: Colors.black,
                                  //     ))
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
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
      child: Image.network(img, fit: BoxFit.fill),
    );
  }
}

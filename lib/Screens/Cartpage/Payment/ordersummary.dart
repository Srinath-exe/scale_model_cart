import 'package:flutter/material.dart';

class OrderSummary extends StatefulWidget {
    Function onSummary;
  OrderSummary({Key? key,required this.onSummary}) : super(key: key);

  @override
  _OrderSummaryState createState() => _OrderSummaryState();
}

class _OrderSummaryState extends State<OrderSummary> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        floatingActionButton: FloatingActionButton.extended(
          elevation: 0,
          onPressed: () {
              widget.onSummary();
          },
          
        
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          label: Row(
            children: [
              Text("Next"),
               Icon(Icons.arrow_forward_ios,size: 15,),
            ],
          ),
        ),
      body: SingleChildScrollView(
              child: Container(
            child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Text(
                    'Order Summary',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 30),
                    textScaleFactor: 1,
                  ),
                ],
              ),
            ),
            item(
                'https://www.scalemodelcart.com/usrfile/40002-18_Norev_Mercedes_Maybach_S_650_a.jpg',
                'Mercedes Maybach S 650',
                12,
                2,
                28800,
                21880),
            item(
                'https://www.scalemodelcart.com/usrfile/40002-18_Minichamps_MahindraM5_Electro_Ambro_a.jpg',
                'Mahindra M5 Electro - Formula B - d\'Ambrosio',
                12,
                2,
                29800,
                27880),
            priceDetails(24755, 2875, 21880),
            coupon(),
          ],
        )),
      ),
    );
  }

  Widget item(String image, String name, double gst, int qty, double price,
      double sellprice) {
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

    Widget detail(String t1, String t2) {
      return Container(
        decoration: BoxDecoration(
            //color: Colors.grey[200],
            borderRadius: BorderRadius.circular(10)),
        //height: MediaQuery.of(context).size.height * 0.05,
        //  width: MediaQuery.of(context).size.width * 0.2,
        // height: MediaQuery.of(context).size.height * 0.05,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              t1,
              style: TextStyle(fontSize: 17),
              textScaleFactor: 1,
            ),
            Text(
              t2,
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[500]),
              textScaleFactor: 1,
            ),
          ],
        ),
      );
    }

    Size size = MediaQuery.of(context).size;
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.transparent,
                  child: img(image),
                ),
              ),
              Container(
                width: size.width * 0.6,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: size.width * 0.5,
                          child: Text(
                            name,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 14),
                            textScaleFactor: 1,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'Free Delivery',
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w600,
                              fontSize: 11),
                          textScaleFactor: 1,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Stack(
                children: [
                  Positioned(
                      child: IconButton(
                          onPressed: () {}, icon: Icon(Icons.delete)))
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                detail('$qty', 'Quantity'),
                detail('$gst' + "%", 'GST'),
                detail('$sellprice', 'Selling Price'),
                Container(
                  //color:Colors.amber,
                  width: MediaQuery.of(context).size.width * 0.30,
                  // height: MediaQuery.of(context).size.height * 0.05,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '$price',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                        textScaleFactor: 1,
                      ),
                      Text(
                        'Sub Total',
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey[800]),
                        textScaleFactor: 1,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 3),
            child: Divider(thickness: 2, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget priceDetails(double price, double discount, double total) {
    return Container(
      child: Column(
        children: [
          Container(
              height: MediaQuery.of(context).size.height * 0.05,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1),
                borderRadius: BorderRadius.all(Radius.circular(0)),
                color: Colors.white),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'PRICE DETAILS',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[700]),
                    textScaleFactor: 1,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.23,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 0.1),
                borderRadius: BorderRadius.all(Radius.circular(0)),
                color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'PRICE (3 items)',
                        style: TextStyle(
                            fontSize: 15,
                            // fontWeight: FontWeight.w500,
                            color: Colors.black),
                        textScaleFactor: 1,
                      ),
                      Text(
                        "₹ " + price.toString(),
                        style: TextStyle(
                            fontSize: 15,
                            //  fontWeight: FontWeight.w500,
                            color: Colors.black),
                        textScaleFactor: 1,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'YOU SAVE',
                        style: TextStyle(
                            fontSize: 15,
                            // fontWeight: FontWeight.w500,
                            color: Colors.black),
                        textScaleFactor: 1,
                      ),
                      Text(
                        "₹ " + discount.toString(),
                        style: TextStyle(
                            fontSize: 15,
                            //fontWeight: FontWeight.w500,
                            color: Colors.black),
                        textScaleFactor: 1,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'SHIPPING CHARGES',
                        style: TextStyle(
                            fontSize: 15,
                            // fontWeight: FontWeight.w500,
                            color: Colors.black),
                        textScaleFactor: 1,
                      ),
                      Text(
                        "₹ 0",
                        style: TextStyle(
                            fontSize: 15,
                            // fontWeight: FontWeight.w500,
                            color: Colors.black),
                        textScaleFactor: 1,
                      ),
                    ],
                  ),
                  Divider(thickness: 2, color: Color(0xffE58714)),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              'TOTAL',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black),
                              textScaleFactor: 1,
                            ),
                            Text(
                              ' (inclusive of GST)',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black),
                              textScaleFactor: 1,
                            ),
                          ],
                        ),
                        Text(
                          "₹ " + total.toString(),
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                          textScaleFactor: 1,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.06),
        ],
      ),
    );
  }

  Widget coupon() {
   
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // Text(
            //   'What would you like to do Next?',
            //   style: TextStyle(
            //       fontSize: 18,
            //       fontWeight: FontWeight.w600,
            //       color: Colors.black),
            //   textScaleFactor: 1,
            // ),
          
          ],
        ),
      ),
    );
  }
}

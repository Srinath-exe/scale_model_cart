import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  bool isChecked = false;
  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    }
    return Colors.green;
  }

  launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            priceDetails(24755, 2875, 21880),
            SizedBox(height: MediaQuery.of(context).size.height * 0.04),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Checkbox(
                  checkColor: Colors.white,
                  fillColor: MaterialStateProperty.resolveWith(getColor),
                  value: isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked = value!;
                    });
                  },
                ),
                Row(
                  children: [
                    Text(
                      'I agree to the ',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey[700]),
                      textScaleFactor: 1,
                    ),
                    GestureDetector(
                      onTap: () {
                        launchURL(
                            'https://www.scalemodelcart.com/terms-conditions');
                      },
                      child: Text(
                        'Terms and Condtions',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Colors.blue),
                        textScaleFactor: 1,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            OutlinedButton(
                child: Text(
                  'Proceed to Payment',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                ),
                style: OutlinedButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Colors.teal,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
                onPressed: () {
                  setState(() {
                    launchURL(
                        'https://checkout.citruspay.com/payu/checkout/');
                  });
                })
          ],
        ),
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
                border: Border.all(color: Colors.black, width: 0.1),
                borderRadius: BorderRadius.all(Radius.circular(0)),
                color: Colors.white),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'ORDER PRICE DETAILS',
                    style: TextStyle(
                        fontSize: 20,
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
                  Divider(thickness: 2, color: Colors.black),
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
        ],
      ),
    );
  }
}

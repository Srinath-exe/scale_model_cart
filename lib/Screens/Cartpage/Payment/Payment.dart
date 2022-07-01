import 'package:flutter/material.dart';
import 'package:scale_model_cart/Screens/Cartpage/Cart.dart';
import 'package:scale_model_cart/constants/constants.dart';
import 'package:scale_model_cart/widgets/buttons.dart';

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
      backgroundColor: accent,
      body: Container(
        child: Column(
          children: [
            priceDetails(context, dark: true),
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
            ThemeButton(text: "Proceed To Payment")
          ],
        ),
      ),
    );
  }
}

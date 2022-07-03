import 'package:flutter/material.dart';

import 'package:scale_model_cart/Screens/Cartpage/Payment/Payment.dart';
import 'package:scale_model_cart/Screens/Cartpage/Payment/ShippingDetails.dart';

import 'package:scale_model_cart/Screens/Cartpage/Payment/paymnetlogin.dart';
import 'package:scale_model_cart/Screens/Cartpage/Payment/ordersummary.dart';
import 'package:scale_model_cart/constants/constants.dart';

enum PaymentState {
  login,
  summary,
  details,
  payments,
}

class PaymentMain extends StatefulWidget {
  const PaymentMain({Key? key}) : super(key: key);

  @override
  _PaymentMainState createState() => _PaymentMainState();
}

class _PaymentMainState extends State<PaymentMain> {
  int index = 1;
  PaymentState paymentState = PaymentState.login;
  List<PaymentState> completedList = [];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: accent,
        body: SafeArea(
          child: Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: progress(),
                ),
                Expanded(
                    // color: Colors.red,
                    // height: MediaQuery.of(context).size.height*0.9,
                    child: main())
              ],
            ),
          ),
        ));
  }

  Widget main() {
    switch (paymentState) {
      case PaymentState.login:
        return PaymentLogin(
          onLogin: () {
            setState(() {
              paymentState = PaymentState.summary;
              completedList.add(PaymentState.login);
            });
          },
        );
      case PaymentState.summary:
        return OrderSummary(
          onSummary: () {
            setState(() {
              paymentState = PaymentState.details;
              completedList.add(PaymentState.summary);
            });
          },
        );
      case PaymentState.details:
        return ShippingDetails(
          onDetails: () {
            setState(() {
              paymentState = PaymentState.payments;
              completedList.add(PaymentState.details);
            });
          },
        );
      case PaymentState.payments:
        return PaymentPage();
        break;
      default:
        return Container();
    }
  }

  Widget progress() {
    Widget icon(String name, bool completed) {
      return Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                children: [
                  name != 'login'
                      ? Container(
                          width: MediaQuery.of(context).size.width * 0.05,
                          height: MediaQuery.of(context).size.height * 0.004,
                          color: completed ? Colors.green : light,
                        )
                      : Container(
                          width: MediaQuery.of(context).size.width * 0.05,
                          height: MediaQuery.of(context).size.height * 0.004,
                          color: accent,
                        ),
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: completed ? Colors.green : light,
                    child: Icon(
                      completed ? Icons.done : Icons.adjust,
                      color: completed ? Colors.white : secondaryLight,
                    ),
                  ),
                  name != 'Payment'
                      ? Container(
                          width: MediaQuery.of(context).size.width * 0.06,
                          height: MediaQuery.of(context).size.height * 0.004,
                          color: completed ? Colors.green : light,
                        )
                      : Container(
                          width: MediaQuery.of(context).size.width * 0.05,
                          height: MediaQuery.of(context).size.height * 0.004,
                          color: accent,
                        ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: Text(
                name,
                style: TextStyle(
                    fontWeight: FontWeight.w500, color: secondaryLight),
              ),
            )
          ],
        ),
      );
    }

    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon('login',
              completedList.contains(PaymentState.login) ? true : false),
          icon('Summary',
              completedList.contains(PaymentState.summary) ? true : false),
          icon('details',
              completedList.contains(PaymentState.details) ? true : false),
          icon('Payment',
              completedList.contains(PaymentState.payments) ? true : false),
        ],
      ),
    );
  }

  Widget progress1() {
    Widget icon(String name, bool completed) {
      return Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                children: [
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundColor: completed ? Colors.green : light,
                        child: Icon(
                          Icons.done,
                          color: completed ? Colors.white : Colors.black,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: Text(name),
                      )
                    ],
                  ),
                  name != 'Payment'
                      ? Container(
                          width: MediaQuery.of(context).size.width * 0.12,
                          height: MediaQuery.of(context).size.height * 0.005,
                          color: Colors.green,
                        )
                      : Container(),
                ],
              ),
            ),
          ],
        ),
      );
    }

    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon('login',
              completedList.contains(PaymentState.login) ? true : false),
          icon('Summary',
              completedList.contains(PaymentState.summary) ? true : false),
          icon('details',
              completedList.contains(PaymentState.details) ? true : false),
          icon('Payment',
              completedList.contains(PaymentState.payments) ? true : false),
        ],
      ),
    );
  }
}

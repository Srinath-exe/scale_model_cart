import 'package:flutter/material.dart';
import 'package:scale_model_cart/constants/constants.dart';

import '../../../Models/product_model.dart';
import '../Cart.dart';
import '../CartCard.dart';

class OrderSummary extends StatefulWidget {
  Function onSummary;
  OrderSummary({Key? key, required this.onSummary}) : super(key: key);

  @override
  _OrderSummaryState createState() => _OrderSummaryState();
}

class _OrderSummaryState extends State<OrderSummary> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: accent,
      floatingActionButton: FloatingActionButton.extended(
        elevation: 0,
        onPressed: () {
          widget.onSummary();
        },
        backgroundColor: secondary,
        foregroundColor: Colors.white,
        label: Row(
          children: [
            Text("Next"),
            SizedBox(
              width: GetSize().width(context) * 0.05,
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 15,
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
            child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            // emptyCart(),
            Column(
              children: List.generate(
                3,
                (index) => CartCard(
                    car: cars[index],
                    img: cars[index].img[0],
                    price: cars[index].price,
                    name: cars[index].name),
              ),
            ),

            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            priceDetails(context, dark: true),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            )
          ],
        )),
      ),
    );
  }
}

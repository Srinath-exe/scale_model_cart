import 'package:flutter/material.dart';
import 'package:scale_model_cart/constants/constants.dart';

class ShippingDetails extends StatefulWidget {
  Function onDetails;
  ShippingDetails({Key? key, required this.onDetails}) : super(key: key);

  @override
  _ShippingDetailsState createState() => _ShippingDetailsState();
}

class _ShippingDetailsState extends State<ShippingDetails> {
  TextStyle style =
      TextStyle(color: Colors.black, fontWeight: FontWeight.w400, fontSize: 14);
  @override
  Widget build(BuildContext context) {
    Size height = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: accent,
      floatingActionButton: FloatingActionButton.extended(
        elevation: 0,
        onPressed: () {
          widget.onDetails();
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
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Text(
                      'Shipping Deatils',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 30),
                      textScaleFactor: 1,
                    ),
                  ],
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 4.0, horizontal: 10),
                      child: Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.85,
                            child: Row(
                              children: [
                                Text(
                                  'Deliver To',
                                  style: style,
                                  textScaleFactor: 1,
                                ),
                              ],
                            ),
                          ),
                          form('Name', Icons.person, 0.85),
                          SizedBox(
                            height: height.height * 0.02,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.85,
                            child: Row(
                              children: [
                                Text(
                                  'Address',
                                  style: style,
                                  textScaleFactor: 1,
                                ),
                              ],
                            ),
                          ),
                          form('Address Line 1', Icons.home, 0.85),
                          form('Address Line 2', Icons.maps_home_work, 0.85),
                          form('City', Icons.apartment_outlined, 0.85),
                          Row(
                            children: [
                              form('State', Icons.location_city, 0.45),
                              form('Postcode', Icons.password, 0.33),
                            ],
                          ),
                          SizedBox(
                            height: height.height * 0.015,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.85,
                            child: Row(
                              children: [
                                Text(
                                  'Phone',
                                  style: style,
                                  textScaleFactor: 1,
                                ),
                              ],
                            ),
                          ),
                          form('Phone', Icons.call, 0.85),
                          SizedBox(
                            height: height.height * 0.015,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.85,
                            child: Row(
                              children: [
                                Text(
                                  'Remarks',
                                  style: style,
                                  textScaleFactor: 1,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Material(
                              elevation: 10,
                              shadowColor: Colors.grey[200],
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.85,
                                alignment: Alignment.center,
                                margin: EdgeInsets.symmetric(horizontal: 10),
                                child: TextFormField(
                                  textAlign: TextAlign.left,
                                  enabled: true,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter this Field';
                                    }
                                    return null;
                                  },
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                  maxLines: null,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 10),
                                    labelText: "Remarks",
                                    alignLabelWithHint: false,
                                    prefixIconConstraints: BoxConstraints(
                                        minWidth: 23, maxHeight: 20),
                                    prefixIcon: Container(
                                      color: Colors.white,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(right: 30),
                                        child: Icon(
                                          Icons.speaker_notes,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),

                                    // hintText: "Password",
                                    hintStyle: TextStyle(
                                        color: Colors.grey, fontSize: 16),
                                    labelStyle: TextStyle(
                                        fontSize: 16, color: Colors.grey),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget form(String hint, IconData icon, double width) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Material(
        elevation: 5,
        shadowColor: Colors.grey[200],
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
          width: MediaQuery.of(context).size.width * width,
          alignment: Alignment.center,
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: TextFormField(
            maxLines: null,
            textAlign: TextAlign.left,
            enabled: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter this Field';
              }
              return null;
            },
            style: TextStyle(
              fontSize: 16,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              labelText: "$hint",
              alignLabelWithHint: false,
              prefixIconConstraints:
                  BoxConstraints(minWidth: 23, maxHeight: 20),
              prefixIcon: Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Icon(
                    icon,
                    color: Colors.grey,
                  ),
                ),
              ),

              // hintText: "Password",
              hintStyle: TextStyle(color: Colors.grey, fontSize: 16),
              labelStyle: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ),
        ),
      ),
    );
  }
}

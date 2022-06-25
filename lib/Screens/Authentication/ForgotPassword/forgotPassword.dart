import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:scale_model_cart/Screens/Authentication/ForgotPassword/NewPassword.dart';

class ForgotPassword extends StatefulWidget {
  @override
  ForgotPasswordState createState() => ForgotPasswordState();
}

class ForgotPasswordState extends State<ForgotPassword> {
  late ScrollController _controller;

  String phoneno = '';
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    _controller = ScrollController(initialScrollOffset: 15);
    super.initState();
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          controller: _controller,
          child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                    Container(
                        color: Colors.white,
                        // height: MediaQuery.of(context).size.height * 0.30,
                        // width: MediaQuery.of(context).size.width,
                        child: Image.asset('assets/images/forgotpassword.png')),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //image
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Container(
                              color: Colors.white,
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 0.15,
                              child: Column(
                                children: [
                                  SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.03),
                                  Row(
                                    children: [
                                      Text("Reset password",
                                          style: TextStyle(
                                              fontSize: 26,
                                              fontWeight: FontWeight.w500)),
                                    ],
                                  ),
                                  SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.01),
                                  Row(
                                    children: [
                                      Text("Forgot your password?",
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.grey[600],
                                              fontWeight: FontWeight.w500)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),

                          ClayContainer(
                              parentColor: Colors.grey[100],
                              borderRadius: 20,
                              depth: 20,
                              surfaceColor: Colors.white,
                              spread: 5,
                              curveType: CurveType.none,
                              color: Colors.white,
                              width: MediaQuery.of(context).size.width * 0.9,
                              //height: MediaQuery.of(context).size.height ,
                              child: Column(children: [
                                Container(
                                    color: Colors.transparent,
                                    width:
                                        MediaQuery.of(context).size.width * 0.8,
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.02),
                                          Text("Enter your registered Email",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.grey,
                                                  fontWeight: FontWeight.w600)),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Material(
                                              elevation: 1,
                                              color: Colors.white,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.6,
                                                alignment: Alignment.center,
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: 40),
                                                child: TextFormField(
                                                  textAlign: TextAlign.left,
                                                  enabled: true,
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                  ),
                                                  onTap: () {},
                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    contentPadding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 10,
                                                            vertical: 10),
                                                    labelText: "Email",
                                                    prefixIconConstraints:
                                                        BoxConstraints(
                                                            minWidth: 23,
                                                            maxHeight: 20),
                                                    prefixIcon: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 20),
                                                      child: Icon(
                                                        Icons.mail_outline,
                                                        color: Colors.grey,
                                                      ),
                                                    ),
                                                    // hintText: "Password",
                                                    hintStyle: TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 16),
                                                    labelStyle: TextStyle(
                                                        fontSize: 16,
                                                        color: Colors.grey),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.01),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.4,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.05,
                                                child: OutlinedButton(
                                                    child: Text(
                                                      'Continue',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 16),
                                                    ),
                                                    style: OutlinedButton
                                                        .styleFrom(
                                                      primary: Colors.white,
                                                      backgroundColor:
                                                          Color(0xFFF5793CE),
                                                      shape: const RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          10))),
                                                    ),
                                                    onPressed: () {
                                                      setState(() {
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        NewPassword()));
                                                      });
                                                    })

                                                //  OutlineButton(
                                                //     highlightedBorderColor:
                                                //         Colors.black,
                                                //     borderSide: BorderSide(
                                                //         color: Colors.black),
                                                //     child: Text(
                                                //       "CONTINUE",
                                                //       textScaleFactor: 1,
                                                //       style: TextStyle(
                                                //         fontSize: 15,
                                                //         color: Colors.black,
                                                //         fontWeight:
                                                //             FontWeight.w600,
                                                //       ),
                                                //     ),
                                                //     onPressed: () {
                                                //       setState(() {
                                                //         Navigator.push(
                                                //             context,
                                                //             MaterialPageRoute(
                                                //                 builder:
                                                //                     (context) =>
                                                //                         Home()));
                                                //       });
                                                //     }),

                                                ),
                                          ),
                                        ]))
                              ]))
                        ])
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
//  ElevatedButton(
//                                             style: ButtonStyle(
//                                               shape: MaterialStateProperty.all<
//                                                       RoundedRectangleBorder>(
//                                                   RoundedRectangleBorder(
//                                                       borderRadius:
//                                                           BorderRadius.circular(
//                                                               50.0),
//                                                       side: BorderSide(
//                                                           color: Colors
//                                                               .transparent))),
//                                               backgroundColor:
//                                                   MaterialStateProperty
//                                                       .resolveWith<Color>(
//                                                 (Set<MaterialState> states) {
//                                                   if (states.contains(
//                                                       MaterialState.pressed))
//                                                     return  Colors.orange;
//                                                     else
//                                                     return Colors.orange;

//                                                 },
//                                               ),
//                                             ),
//                                             child: Text(
//                                               'Continue',
//                                               style: TextStyle(
//                                                 fontSize: 20,
//                                                 fontWeight: FontWeight.bold,
//                                               ),
//                                             ),
//                                             onPressed: () {

//                                             },
//                                           ),

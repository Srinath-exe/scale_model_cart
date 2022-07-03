import 'package:flutter/material.dart';
import 'package:page_route_transition/page_route_transition.dart';
import 'package:scale_model_cart/Screens/Authentication/ForgotPassword/forgotPassword.dart';
import 'package:scale_model_cart/constants/constants.dart';

import '../HomePage/main_screen.dart';

class SignUpScreen extends StatefulWidget {
  Function login;
  SignUpScreen({Key? key, required this.login}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width * 1;
    return Container(
        //  height: height,
        width: width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            design(),
            SizedBox(
              height: height * 0.05,
            ),
            form()
          ],
        ));
  }

  Widget design() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      child: Stack(
        children: [
          //   Positioned(
          //   right: 0,
          //   child: Container(
          //     height: MediaQuery.of(context).size.height * 0.4,
          //     width: MediaQuery.of(context).size.width * 0.8,
          //     child: Image.asset('assets/images/image_01.jpg')
          //   ),
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.2,
                  width: MediaQuery.of(context).size.width * 0.6,
                  color: Colors.transparent,
                  child: Image.asset('assets/images/logo.png'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget form() {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.transparent,
      child: Form(
        child: Column(
          children: [
            Material(
              elevation: 10,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.6,
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 40),
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
                        EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    labelText: "Name",
                    prefixIconConstraints:
                        BoxConstraints(minWidth: 23, maxHeight: 20),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Icon(
                        Icons.person,
                        color: Colors.grey,
                      ),
                    ),
                    // hintText: "Password",
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 16),
                    labelStyle: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Material(
              elevation: 10,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.6,
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 40),
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
                        EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    labelText: "Email",
                    prefixIconConstraints:
                        BoxConstraints(minWidth: 23, maxHeight: 20),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Icon(
                        Icons.mail_outline,
                        color: Colors.grey,
                      ),
                    ),
                    // hintText: "Password",
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 16),
                    labelStyle: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Material(
              elevation: 10,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.6,
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 40),
                child: TextFormField(
                  textAlign: TextAlign.left,
                  enabled: true,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                  obscureText: true,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    labelText: "Password",
                    prefixIconConstraints:
                        BoxConstraints(minWidth: 23, maxHeight: 20),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Icon(
                        Icons.password,
                        color: Colors.grey,
                      ),
                    ),
                    // hintText: "Password",
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 16),
                    labelStyle: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: GetSize().height(context) * 0.05,
            ),
            SmallButton(
              text: "Sign Up",
              color: accent,
              onPressed: () {
                setState(() {
                  Navigator.push(
                      context,
                      PageRouteTransitionBuilder(
                          page: MainScreen(),
                          curve: Curves.easeOut,
                          duration: Duration(milliseconds: 600),
                          effect: TransitionEffect.bottomToTop));
                });
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account? ",
                  style: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.w700),
                ),
                GestureDetector(
                  onTap: () {
                    widget.login();
                  },
                  child: Container(
                    padding: const EdgeInsets.only(right: 0.0, top: 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text('Login!',
                            style: TextStyle(
                                color: accent, fontWeight: FontWeight.w600)),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

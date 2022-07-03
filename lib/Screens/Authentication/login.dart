import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:page_route_transition/page_route_transition.dart';
import 'package:scale_model_cart/Screens/Authentication/ForgotPassword/forgotPassword.dart';
import 'package:scale_model_cart/Screens/HomePage/home_screen.dart';
import 'package:scale_model_cart/Screens/HomePage/main_screen.dart';

import '../../constants/constants.dart';
import '../ProductViewpage/product_detail_view.dart';

class LoginScreen extends StatefulWidget {
  Function signup;
  LoginScreen({Key? key, required this.signup}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late double height;
  late double width;

  FocusNode emailFocus = new FocusNode();
  FocusNode passwordFocus = new FocusNode();

  Material material = new Material();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height * 0.8;
    width = MediaQuery.of(context).size.width;
    return Container(
        height: height,
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
      height: MediaQuery.of(context).size.height * 0.4,
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
      width: width,
      color: Colors.transparent,
      child: Form(
        child: Column(
          children: [
            ThemeTextfld(
                errorText: "email cannot be emplty",
                focus: emailFocus,
                icon: Icons.mail,
                labelText: "Email"),
            SizedBox(
              height: 15,
            ),
            ThemeTextfld(
                errorText: "Password cannot be emplty",
                focus: passwordFocus,
                icon: Icons.password_rounded,
                labelText: "Password"),
            GestureDetector(
              onTap: () {
                setState(() {
                  Navigator.push(
                      context,
                      PageRouteTransitionBuilder(
                          page: ForgotPassword(),
                          curve: Curves.easeOut,
                          duration: Duration(milliseconds: 600),
                          effect: TransitionEffect.topToBottom));
                });
              },
              child: Container(
                padding: const EdgeInsets.only(right: 40.0, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('Forgot Password?',
                        style: TextStyle(
                            color: light.withOpacity(0.5),
                            fontWeight: FontWeight.w500)),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: GetSize().height(context) * 0.05,
            ),
            SmallButton(
              text: "Login",
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
                    widget.signup();
                  },
                  child: Container(
                    padding: const EdgeInsets.only(right: 0.0, top: 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text('Sign UP!',
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

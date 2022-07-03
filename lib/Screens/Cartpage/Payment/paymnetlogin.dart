import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scale_model_cart/Screens/Authentication/ForgotPassword/forgotPassword.dart';
import 'package:scale_model_cart/constants/constants.dart';

class PaymentLogin extends StatefulWidget {
  Function onLogin;
  PaymentLogin({Key? key, required this.onLogin}) : super(key: key);

  @override
  _PaymentLoginState createState() => _PaymentLoginState();
}

class _PaymentLoginState extends State<PaymentLogin> {
  late double height;
  late double width;
  int index = 0;
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
    return SingleChildScrollView(
      child: Container(
          //  height: height,
          width: width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              design(),
              SizedBox(
                height: height * 0.03,
              ),
              index == 0
                  ? Container(
                      child: Column(
                        children: [
                          form(),
                          SizedBox(
                            height: height * 0.03,
                          ),
                          guest(),
                        ],
                      ),
                    )
                  : Container(
                      child: guestLogin(),
                    )
            ],
          )),
    );
  }

  Widget design() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.2,
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
                      MaterialPageRoute(
                          builder: (context) => ForgotPassword()));
                });
              },
              child: Container(
                padding: const EdgeInsets.only(right: 40.0, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('Forgot Password?',
                        style: TextStyle(
                            color: secondaryLight,
                            fontWeight: FontWeight.w600)),
                  ],
                ),
              ),
            ),
            SmallButton(
              text: "Login",
              onPressed: () {
                widget.onLogin();
                setState(() {});
              },
            )
          ],
        ),
      ),
    );
  }

  Widget guest() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'New Customers',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 30),
                  textScaleFactor: 1,
                ),
              ],
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Text(
              'Proceed to checkout and you will have an opportunity to create an account at the end if one does not already exist for you.',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 15),
              textScaleFactor: 1,
            ),
            SizedBox(
              height: height * 0.02,
            ),
            SmallButton(
              text: "Guest Login",
              onPressed: () {
                setState(() {
                  index = 1;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget guestLogin() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'Continue as Guest',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 30),
                  textScaleFactor: 1,
                ),
              ],
            ),
            SizedBox(
              height: height * 0.04,
            ),
            ThemeTextfld(
                errorText: "email cannot be emplty",
                focus: emailFocus,
                icon: Icons.mail,
                labelText: "Email"),
            GestureDetector(
              onTap: () {
                setState(() {
                  index = 0;
                });
              },
              child: Container(
                padding: const EdgeInsets.only(right: 20.0, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('Alread have an Account?',
                        style: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.w600)),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: height * 0.01,
            ),
            Container(
              width: width * 0.7,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: ElevatedButton(
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                  side: BorderSide(color: Color(0xff7b4775)))),
                          backgroundColor:
                              MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                              if (states.contains(MaterialState.pressed))
                                return Color(0xff7b4775);
                              return Color(
                                  0xff7b4775); // Use the component's default.
                            },
                          ),
                        ),
                        onPressed: () {
                          widget.onLogin();
                        },
                        child: Container(
                          width: width * 0.4,
                          padding: const EdgeInsets.all(12.0),
                          child: Center(
                              child: Text(
                            "Continue as Guest",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700),
                          )),
                        )),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

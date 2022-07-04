import 'package:flutter/material.dart';
import 'package:scale_model_cart/Screens/Authentication/login.dart';
import 'package:scale_model_cart/Screens/Authentication/signup.dart';
import 'package:scale_model_cart/constants/constants.dart';
import 'package:tab_container/tab_container.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

enum AuthType {
  login,
  signup,
}

class _AuthScreenState extends State<AuthScreen> {
  AuthType _authType = AuthType.login;
  TabContainerController controller = new TabContainerController(length: 2);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: secondary.withOpacity(0.8),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Container(
                  width: width,
                  child: Row(
                    children: [
                      Container(
                        width: width * 0.35,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  _authType = AuthType.login;
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 8),
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: _authType == AuthType.login
                                          ? accent
                                          : light.withOpacity(0.6),
                                      width: 3.0,
                                    ),
                                  ),
                                ),
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                      color: _authType == AuthType.login
                                          ? accent
                                          : light.withOpacity(0.6),
                                      fontFamily: "Nunito-Bold",
                                      fontSize: 16),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  _authType = AuthType.signup;
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 8),
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: _authType == AuthType.signup
                                          ? accent
                                          : light.withOpacity(0.6),
                                      width: 3.0,
                                    ),
                                  ),
                                ),
                                child: Text(
                                  "SignUp",
                                  style: TextStyle(
                                      color: _authType == AuthType.signup
                                          ? accent
                                          : light.withOpacity(0.6),
                                      fontFamily: "Nunito-Bold",
                                      fontSize: 16),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                _authType == AuthType.login
                    ? LoginScreen(
                        signup: () {
                          setState(() {
                            _authType = AuthType.signup;
                          });
                        },
                      )
                    : SignUpScreen(
                        login: () {
                          setState(() {
                            _authType = AuthType.login;
                          });
                        },
                      )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

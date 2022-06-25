import 'package:flutter/material.dart';
import 'package:scale_model_cart/Screens/Authentication/login.dart';
import 'package:scale_model_cart/Screens/Authentication/signup.dart';

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

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
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
                                        ? Colors.black
                                        : Colors.white,
                                    width: 3.0,
                                  ),
                                ),
                              ),
                              child: Text(
                                "Login",
                                style: TextStyle(
                                    color: _authType == AuthType.login
                                        ? Colors.purple.shade900
                                        : Colors.grey,
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
                                        ? Colors.black
                                        : Colors.white,
                                    width: 3.0,
                                  ),
                                ),
                              ),
                              child: Text(
                                "SignUp",
                                style: TextStyle(
                                    color: _authType == AuthType.signup
                                        ? Colors.purple.shade700
                                        : Colors.grey,
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
    );
  }
}
// TODO Flutter Fancy Page Wave Transition Animation | Flutter App Tutorial
// Flutter Boats Community Challenge | Retos de la comunidad | Animations | Animaciones | Challenge
// Book Concept App | Animaciones | Animations | Flutter Challenge
// Flutter Nike Store App UI Concept - Speed Code
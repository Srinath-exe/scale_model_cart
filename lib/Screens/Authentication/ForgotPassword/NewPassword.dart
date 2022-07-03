import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:page_route_transition/page_route_transition.dart';
import 'package:scale_model_cart/Screens/Authentication/authscreen.dart';
import 'package:scale_model_cart/Screens/HomePage/home_screen.dart';
import 'package:scale_model_cart/constants/constants.dart';

class NewPassword extends StatefulWidget {
  @override
  _NewPasswordState createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  late bool _passwordVisible;
  late ScrollController _controller;
  late bool _passwordVisible1;
  late String password;
  late String passwordConfirm;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _passwordVisible = true;
    _controller = ScrollController(initialScrollOffset: 15);
    _passwordVisible1 = true;
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: secondary,
        body: SafeArea(
          child: SingleChildScrollView(
            controller: _controller,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: _formKey,
                  child: Column(children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Container(
                        color: Colors.transparent,
                        height: MediaQuery.of(context).size.height * 0.3,
                        width: MediaQuery.of(context).size.width,
                        child: Image.asset('assets/images/newpass.png')),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                    Row(
                      children: [
                        Text(
                          'Create new password',
                          style: TextStyle(
                              color: accent,
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Text(
                      'Your new password must be different from the previous used Password',
                      style: TextStyle(
                          fontSize: 14,
                          color: light,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                    ClayContainer(
                      // emboss: true,
                      depth: 25,
                      spread: 5,
                      parentColor: secondary,
                      surfaceColor: secondaryLight,
                      curveType: CurveType.concave,
                      customBorderRadius: BorderRadius.circular(20),
                      color: accent,
                      height: MediaQuery.of(context).size.height * 0.3,
                      width: MediaQuery.of(context).size.width * 0.95,

                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15.0, vertical: 4),
                            child: Row(
                              children: [
                                Text(
                                  'Password',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: light),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Material(
                              elevation: 2,
                              shadowColor: Colors.grey[200],
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.8,
                                alignment: Alignment.center,
                                margin: EdgeInsets.symmetric(horizontal: 10),
                                child: TextFormField(
                                  obscureText: _passwordVisible,
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
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 10),
                                    labelText: "New Password",
                                    alignLabelWithHint: false,
                                    prefixIconConstraints: BoxConstraints(
                                        minWidth: 23, maxHeight: 20),
                                    prefixIcon: Container(
                                      color: Colors.white,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(right: 15),
                                        child: Icon(
                                          Icons.password,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        // Based on passwordVisible state choose the icon
                                        _passwordVisible
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                        color: Colors.grey,
                                        size: 20,
                                      ),
                                      onPressed: () {
                                        // Update the state i.e. toogle the state of passwordVisible variable
                                        setState(() {
                                          _passwordVisible = !_passwordVisible;
                                        });
                                      },
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
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15.0, vertical: 4),
                            child: Row(
                              children: [
                                Text(
                                  'Confirm password',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: light),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Material(
                              elevation: 2,
                              shadowColor: Colors.grey[200],
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.8,
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
                                  obscureText: _passwordVisible1,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 10),
                                    labelText: "Confirm New Password",
                                    alignLabelWithHint: false,
                                    prefixIconConstraints: BoxConstraints(
                                        minWidth: 23, maxHeight: 20),
                                    prefixIcon: Container(
                                      color: Colors.white,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(right: 15),
                                        child: Icon(
                                          Icons.password,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        // Based on passwordVisible state choose the icon
                                        _passwordVisible
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                        color: Colors.grey,
                                        size: 20,
                                      ),
                                      onPressed: () {
                                        // Update the state i.e. toogle the state of passwordVisible variable
                                        setState(() {
                                          _passwordVisible1 =
                                              !_passwordVisible1;
                                        });
                                      },
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
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    SmallButton(
                      text: "Rest Password",
                      color: accent,
                      onPressed: (() {
                        setState(() {
                          Navigator.push(
                              context,
                              PageRouteTransitionBuilder(
                                  page: AuthScreen(),
                                  curve: Curves.easeOut,
                                  duration: Duration(milliseconds: 600),
                                  effect: TransitionEffect.bottomToTop));
                        });
                      }),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.04,
                    ),
                  ]),
                ),
              ),
            ),
          ),
        ));
  }
}

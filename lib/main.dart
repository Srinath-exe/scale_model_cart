import 'package:flutter/material.dart';
import 'package:scale_model_cart/Screens/HomePage/home.dart';
import 'package:scale_model_cart/constants/color_schemes.g.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        platform: TargetPlatform.iOS,
        colorScheme: lightColorScheme,
      ),
      home: Home(),
    );
  }
}

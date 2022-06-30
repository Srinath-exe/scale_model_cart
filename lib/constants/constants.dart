import 'package:flutter/material.dart';

Color primary = Color(0xff49426C);
Color secondary = Color(0xff272F3E);
Color secondaryLight = Color(0xff3C424E);
Color accent = Color(0xffEEC08C);
Color primaryDark = Color(0xff373358);
Color light = Color(0xffffffff);

final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

class GetSize {
  double height(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  double width(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }
}

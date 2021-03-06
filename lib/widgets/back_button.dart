import 'package:flutter/material.dart';

import '../constants/constants.dart';

enum BackButtonTheme { light, dark, green }

ThemeValues getTheme(BackButtonTheme theme) {
  ThemeValues light = ThemeValues(primary: primaryDark, secondary: secondary);
  ThemeValues dark = ThemeValues(primary: Colors.white, secondary: secondary);

  switch (theme) {
    case BackButtonTheme.dark:
      return dark;

    case BackButtonTheme.light:
      return light;

    default:
      return dark;
  }
}

class ThemeValues {
  ThemeValues({required this.primary, required this.secondary});
  Color primary;
  Color secondary;
}

class CustomBackButton extends StatefulWidget {
  final void Function()? onTap;
  IconData icon;
  BackButtonTheme theme;
  double size;
  CustomBackButton(
      {Key? key,
      this.onTap,
      this.size = 60,
      this.icon = Icons.arrow_back_ios_new_rounded,
      this.theme = BackButtonTheme.green})
      : super(key: key);

  @override
  State<CustomBackButton> createState() => _CustomBackButtonState();
}

class _CustomBackButtonState extends State<CustomBackButton> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double size = GetSize().width(context) * (widget.size * 0.0024);
    ThemeValues themeColor = getTheme(widget.theme);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: size,
        height: size,
        child: Material(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          clipBehavior: Clip.hardEdge,
          color: themeColor.secondary,
          child: Center(
            child: Ink(
              width: size,
              height: size,
              child: InkWell(
                onTap: widget.onTap,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 2.0),
                    child: Icon(
                      widget.icon,
                      color: themeColor.primary,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomIconButton extends StatefulWidget {
  final Function onTap;
  IconData iconData;

  CustomIconButton({Key? key, required this.onTap, required this.iconData})
      : super(key: key);

  @override
  State<CustomIconButton> createState() => _CustomIconButtonState();
}

class _CustomIconButtonState extends State<CustomIconButton> {
  @override
  void initState() {
    if (widget.onTap == null) {
      Navigator.pop(context);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Material(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          clipBehavior: Clip.hardEdge,
          // color: Color(0xff24A645).withOpacity(0.07),
          child: Center(
            child: Ink(
              width: 32.0,
              height: 32.0,
              child: InkWell(
                onTap: () {
                  widget.onTap();
                },
                child: Center(
                  child: Icon(
                    widget.iconData,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Container(
//             height: 32,
//             width: 32,
//             decoration: BoxDecoration(
//                 border: Border.all(color: Colors.black),
//                 color: Colors.white.withOpacity(0.5),
//                 borderRadius: BorderRadius.circular(10)),
//             alignment: Alignment.center,
//             child: const Icon(
//               Icons.arrow_back_ios_new_rounded,
//               color: Colors.black,
//             ),
//           ),

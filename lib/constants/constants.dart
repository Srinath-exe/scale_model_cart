import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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

class SmallButton extends StatefulWidget {
  void Function()? onPressed;
  Color? color;
  String text;
  SmallButton(
      {Key? key,
      this.color = const Color(0xff272F3E),
      this.onPressed,
      required this.text})
      : super(key: key);

  @override
  State<SmallButton> createState() => _SmallButtonState();
}

class _SmallButtonState extends State<SmallButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: GetSize().width(context),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          side: BorderSide(color: widget.color!))),
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.pressed))
                        return widget.color!;
                      return widget.color!; // Use the component's default.
                    },
                  ),
                ),
                onPressed: widget.onPressed,
                child: Container(
                  width: GetSize().width(context) * 0.4,
                  padding: const EdgeInsets.all(12.0),
                  child: Center(
                      child: Text(
                    widget.text,
                    style: TextStyle(
                        color: widget.color == const Color(0xff272F3E)
                            ? Colors.white
                            : Colors.black,
                        fontWeight: FontWeight.w700),
                  )),
                )),
          )
        ],
      ),
    );
  }
}

class ThemeTextfld extends StatefulWidget {
  FocusNode focus;
  String errorText;
  String labelText;
  IconData icon;
  ThemeTextfld(
      {Key? key,
      required this.errorText,
      required this.focus,
      required this.icon,
      required this.labelText})
      : super(key: key);

  @override
  State<ThemeTextfld> createState() => _ThemeTextfldState();
}

class _ThemeTextfldState extends State<ThemeTextfld> {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4,
      // shadowColor: widget.focus.hasFocus ? Colors.red[200] : Colors.white,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.6,
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: 40),
        child: TextFormField(
          focusNode: widget.focus,
          textAlign: TextAlign.left,
          enabled: true,
          style: TextStyle(
            fontSize: 16,
          ),
          onTap: () {
            SystemChannels.textInput.invokeMethod('TextInput.show');
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return widget.errorText;
            }
            return null;
          },
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            labelText: widget.labelText,
            prefixIconConstraints: BoxConstraints(minWidth: 23, maxHeight: 20),
            prefixIcon: Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Icon(
                widget.icon,
                color: Colors.grey,
              ),
            ),
            // hintText: "Password",
            hintStyle: TextStyle(color: Colors.grey, fontSize: 16),
            labelStyle: TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ),
      ),
    );
  }
}

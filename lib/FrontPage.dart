import 'package:backdrop/scaffold.dart';
import 'package:flutter/material.dart';

import 'Login.dart';

class MyFrontPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(resizeToAvoidBottomPadding: false, body: TextInputWidget());
  }
}

class TextInputWidget extends StatefulWidget {
  @override
  _TextInputWidgetState createState() => _TextInputWidgetState();
}

class _TextInputWidgetState extends State<TextInputWidget>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    double swidth = MediaQuery.of(context).size.width;
    double sheight = MediaQuery.of(context).size.height;

    double wcenter(double width) {
      return (swidth / 2 - width / 2);
    }

    double hcenter(double height) {
      return (sheight / 2 - height / 2);
    }

    return Stack(children: <Widget>[
      Positioned(
          top: 60,
          left: wcenter(250),
          child: Image(image: AssetImage('assets/RedCross_Logo.png'))),
      Container(),
      Positioned(
          top: 430,
          left: wcenter(300),
          child: Container(
              width: 300,
              height: 50,
              child: FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.red)),
                onPressed: () => Backdrop.of(context).fling(),
                child: Text("Login"),
                color: Colors.red,
                textColor: Colors.white,
                disabledColor: Colors.grey,
              ))),
    ]);
  }
}

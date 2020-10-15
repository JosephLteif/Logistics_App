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
    return Stack(children: <Widget>[
      Positioned(
          top: 60,
          left: 90,
          child: Image(image: AssetImage('assets/RedCross_Logo.png'))),
      Positioned(
          top: 360,
          left: 60,
          child: Container(
              width: 300,
              height: 50,
              child: FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.red)),
                onPressed: () => Backdrop.of(context).fling(),
                child: Text("Sign Up"),
                color: Colors.transparent,
                textColor: Colors.red,
              ))),
      Container(),
      Positioned(
          top: 430,
          left: 60,
          child: Container(
              width: 300,
              height: 50,
              child: FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.red)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyLoginPage()),
                  );
                },
                child: Text("Login"),
                color: Colors.red,
                textColor: Colors.white,
                disabledColor: Colors.grey,
              ))),
    ]);
  }
}

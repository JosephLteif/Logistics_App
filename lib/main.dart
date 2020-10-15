import 'package:Logistics_App/SignUp.dart';
import 'package:backdrop/backdrop.dart';
import 'package:flutter/material.dart';

import 'FrontPage.dart';
import 'Login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Red Cross Test App',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BackdropScaffold(
      appBar: AppBar(
        title: Text("Logistics Platform"),
        actions: <Widget>[BackdropToggleButton(icon: AnimatedIcons.menu_close)],
      ),
      backLayer: Center(
        child: MySignUpPage(),
      ),
      frontLayer: Center(
        child: MyFrontPage(),
      ),
    );
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
          top: 200,
          child: FlatButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                side: BorderSide(color: Colors.red)),
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => MySignUpPage()),
              // );
            },
            child: Text("Sign Up"),
            color: Colors.transparent,
            textColor: Colors.red,
          )),
      Container(),
      Positioned(
          top: 275,
          right: 150,
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
          )),
    ]);
  }
}

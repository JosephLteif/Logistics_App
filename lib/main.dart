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
        actions: <Widget>[BackdropToggleButton(icon: AnimatedIcons.close_menu)],
      ),
      backLayer: Center(
        child: MyLoginPage(),
      ),
      frontLayer: Center(
        child: MyFrontPage(),
      ),
    );
  }
}

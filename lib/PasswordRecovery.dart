import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class MyPasswordRecoveryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text('Hello Red Cross!'),
          elevation: 0.0,
        ),
        body: TextInputWidget());
  }
}

class TextInputWidget extends StatefulWidget {
  @override
  _TextInputWidgetState createState() => _TextInputWidgetState();
}

class _TextInputWidgetState extends State<TextInputWidget>
    with SingleTickerProviderStateMixin {
  TextEditingController email = new TextEditingController();

  @override
  Future<void> resetPassword(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Positioned(
          top: 80,
          left: 30,
          child: Container(
              child: Text(
            "Recover your password",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 35, color: Colors.red, height: 2),
          ))),
      Positioned(
          top: 275,
          right: 50,
          child: Container(
            child: TextField(
              controller: email,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.mail),
                  labelText: "Email",
                  border: OutlineInputBorder()),
            ),
            width: 300,
          )),
      Container(),
      Positioned(
          top: 415,
          left: 275,
          child: FlatButton(
            onPressed: () {
              resetPassword(email.text.trim());
            },
            child: Text("Done", style: TextStyle(fontSize: 20)),
            textColor: Colors.white,
            color: Colors.red,
            disabledColor: Colors.grey,
          )),
      Container(
        width: 40,
        height: 60,
      ),
    ]);
  }
}

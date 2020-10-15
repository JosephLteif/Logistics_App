import 'package:Logistics_App/SignUp.dart';
import 'package:flutter/material.dart';

class MyLoginPage extends StatelessWidget {
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
  TextEditingController name = new TextEditingController();
  TextEditingController password = new TextEditingController();
  String text = "Login";

  void onChanged() {
    if (name.text.startsWith("admin") && password.text.startsWith("admin"))
      text = "login";
    // else
    // text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Positioned(
          child: Container(
              decoration: BoxDecoration(
                  boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 50)],
                  color: Colors.red,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(36),
                      bottomRight: Radius.circular(36))),
              height: 120,
              width: 500,
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 40, color: Colors.white, height: 2),
              ))),
      Positioned(
          top: 200,
          right: 50,
          child: Container(
            child: TextField(
              controller: name,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.supervised_user_circle),
                  labelText: "Username",
                  border: OutlineInputBorder()),
            ),
            width: 300,
          )),
      Positioned(
          top: 275,
          right: 50,
          child: Container(
            child: TextField(
              controller: password,
              obscureText: true,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.security),
                  labelText: "Password",
                  border: OutlineInputBorder()),
            ),
            width: 300,
          )),
      Positioned(
          top: 340,
          left: 50,
          child: FlatButton(
            onPressed: () {
              setState(() {
                onChanged();
              });
            },
            child: Text("Forgot your password?"),
            textColor: Colors.lightBlue,
          )),
      Container(),
      Positioned(
          top: 340,
          left: 275,
          child: FlatButton(
            onPressed: () {
              setState(() {
                onChanged();
              });
            },
            child: Text("Login"),
            color: Colors.red,
            textColor: Colors.white,
            disabledColor: Colors.grey,
          )),
      Container(
        width: 40,
        height: 60,
      ),
    ]);
  }
}

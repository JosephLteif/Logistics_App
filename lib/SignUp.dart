import 'package:flutter/material.dart';

class MySignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: Text('Sign Up'),
        //   elevation: 0.0,
        // ),
        resizeToAvoidBottomPadding: false,
        body: TextInputWidget());
  }
}

class TextInputWidget extends StatefulWidget {
  @override
  _TextInputWidgetState createState() => _TextInputWidgetState();
}

class _TextInputWidgetState extends State<TextInputWidget>
    with SingleTickerProviderStateMixin {
  TextEditingController username = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();

  void onChanged() {}

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Positioned(
          top: 40,
          left: 40,
          child: Container(
              child: Text(
            "Create an account",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 40, color: Colors.red, height: 2),
          ))),
      Positioned(
          top: 200,
          right: 50,
          child: Container(
            child: TextField(
              controller: username,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.supervised_user_circle),
                  labelText: "Username",
                  border: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.white, width: 0.0),
                  )),
            ),
            width: 300,
          )),
      Positioned(
          top: 275,
          right: 50,
          child: Container(
            child: TextField(
              controller: password,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.mail),
                  labelText: "Email",
                  border: OutlineInputBorder()),
            ),
            width: 300,
          )),
      Positioned(
          top: 350,
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
      Container(),
      Positioned(
          top: 415,
          left: 275,
          child: FlatButton(
            onPressed: () {
              setState(() {
                onChanged();
              });
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

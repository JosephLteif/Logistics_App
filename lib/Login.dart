import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'PasswordRecovery.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class MyLoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text('Hello Red Cross!'),
          elevation: 0.0,
        ),
        body: _EmailPasswordForm());
  }
}

class _EmailPasswordForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _EmailPasswordFormState();
}

class _EmailPasswordFormState extends State<_EmailPasswordForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _success;
  String _userEmail;
  String text = "Login";

  Future<String> _signInWithEmailAndPassword() async {
    final FirebaseUser user = (await _auth.signInWithEmailAndPassword(
      email: _emailController.text.trim(),
      password: _passwordController.text,
    ))
        .user;

    if (user != null && user.isEmailVerified) {
      setState(() {
        _success = true;
        _userEmail = user.email;
        Scaffold.of(context)
            .showSnackBar(SnackBar(content: Text('Login Successful!')));
      });
    } else {
      setState(() {
        _success = false;
        Scaffold.of(context)
            .showSnackBar(SnackBar(content: Text('Failed to authenthicate!')));
      });
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Stack(children: <Widget>[
          Positioned(
              top: 40,
              left: 150,
              child: Container(
                  child: Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 40, color: Colors.red, height: 2),
              ))),
          Positioned(
              top: 200,
              right: 50,
              child: Container(
                child: TextFormField(
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  controller: _emailController,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.supervised_user_circle),
                      labelText: "Email",
                      border: OutlineInputBorder()),
                ),
                width: 300,
              )),
          Positioned(
              top: 275,
              right: 50,
              child: Container(
                child: TextFormField(
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  controller: _passwordController,
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MyPasswordRecoveryPage()),
                  );
                },
                child: Text("Forgot your password?"),
                textColor: Colors.lightBlue,
              )),
          Container(),
          Positioned(
              top: 340,
              left: 275,
              child: FlatButton(
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    _signInWithEmailAndPassword();
                  }
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
        ]));
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
      text = "Login";
    else
      text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Positioned(
          top: 40,
          left: 150,
          child: Container(
              child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 40, color: Colors.red, height: 2),
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

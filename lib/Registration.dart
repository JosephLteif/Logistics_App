import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class MySignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false, body: _RegisterEmailSection());
  }
}

class _RegisterEmailSection extends StatefulWidget {
  final String title = 'Registration';
  @override
  _RegisterEmailSectionState createState() => _RegisterEmailSectionState();
}

class _RegisterEmailSectionState extends State<_RegisterEmailSection>
    with SingleTickerProviderStateMixin {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _success;
  String _userEmail;

  Future<String> _register() async {
    final FirebaseUser user = (await _auth.createUserWithEmailAndPassword(
      email: _emailController.text.trim(),
      password: _passwordController.text,
    ))
        .user;

    try {
      await user.sendEmailVerification();
      return user.uid;
    } catch (e) {}

    if (user != null) {
      setState(() {
        _success = true;
        _userEmail = user.email;
      });
    } else {
      setState(() {
        _success = true;
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
              left: 40,
              child: Container(
                  child: Text(
                "Create an account",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 40, color: Colors.red, height: 2),
              ))),
          Positioned(
              top: 275,
              right: 50,
              child: Container(
                child: TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  controller: _emailController,
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
                child: TextFormField(
                  validator: (value) {
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
          Container(),
          Positioned(
              top: 415,
              left: 275,
              child: FlatButton(
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    _register();
                  }
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
        ]));
  }
}

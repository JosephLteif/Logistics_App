import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'PasswordRecovery.dart';
import 'Registration.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

class MyLoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(color: Colors.black),
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

  // _signOut() async {
  //   await _auth.signOut();
  //  }

  Future<String> signInWithGoogle() async {
    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    final AuthResult authResult = await _auth.signInWithCredential(credential);
    final FirebaseUser user = authResult.user;

    if (user != null) {
      assert(!user.isAnonymous);
      assert(await user.getIdToken() != null);

      final FirebaseUser currentUser = await _auth.currentUser();
      assert(user.uid == currentUser.uid);

      Scaffold.of(context)
          .showSnackBar(SnackBar(content: Text('Login Successful!')));
    }

    Scaffold.of(context)
        .showSnackBar(SnackBar(content: Text('Failed to authenthicate!')));
  }

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
    double swidth = MediaQuery.of(context).size.width;
    double sheight = MediaQuery.of(context).size.height;

    double wcenter(double width) {
      return (swidth / 2 - width / 2);
    }

    return Form(
        key: _formKey,
        child: Stack(children: <Widget>[
          Positioned(
              left: 30,
              child: Container(
                  child: Text(
                "Login",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.red,
                    height: 2),
              ))),
          Positioned(
              top: 100,
              left: wcenter(370),
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
                      hintText: 'Email@hotmail.com',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(60)))),
                ),
                width: 370,
                height: 45,
              )),
          Positioned(
              top: 165,
              left: wcenter(370),
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
                      hintText: '********',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(60)))),
                ),
                width: 370,
                height: 45,
              )),
          Positioned(
              top: 200,
              left: wcenter(0),
              child: FlatButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MyPasswordRecoveryPage()),
                  );
                },
                child: Text("Forgot your password?"),
                textColor: Colors.blue,
                hoverColor: Colors.lightBlue,
              )),
          Positioned(
              width: 310,
              height: 40,
              top: 270,
              left: wcenter(310),
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
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
              )),
          Positioned(
            top: 330,
            left: wcenter(15),
            child: Text("OR"),
          ),
          Container(),
          Positioned(
            top: 480,
            left: 80,
            child: Row(
              children: <Widget>[
                Text("Don't have an account already?"),
                FlatButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MySignUpPage()),
                    );
                  },
                  child: Text("Sign Up."),
                  textColor: Colors.blue,
                  hoverColor: Colors.lightBlue,
                )
              ],
            ),
          ),
          Positioned(
              width: 330,
              height: 40,
              top: 370,
              left: wcenter(310),
              child: FlatButton(
                onPressed: () {
                  signInWithGoogle().then((result) {});
                },
                child: Row(children: <Widget>[
                  Image(
                      image: AssetImage("assets/google_logo.png"),
                      height: 35.0),
                  Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        'Sign in with Google',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.grey,
                        ),
                      ))
                ]),
                color: Colors.transparent,
                disabledColor: Colors.grey,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
              )),
          Container(
            width: 40,
            height: 60,
          ),
        ]));
  }
}

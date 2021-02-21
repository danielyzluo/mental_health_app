import 'package:flash_chat/components/rounded_button.dart';
import 'package:flash_chat/constants.dart';
import 'package:flash_chat/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'login_success.dart';

class LoginScreen extends StatefulWidget {

  static String id = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final inputuser = new TextEditingController();
  final inputpw = new TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    height: 70.0,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30.0,
            ),
            Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back),
                    alignment: Alignment.centerLeft,
                    onPressed: () {
                      Navigator.pushNamed(context, WelcomeScreen.id);
                    },
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Log In",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 28.0),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30.0,
            ),
            TextField( //user
              onChanged: (value) {
                //Do something with the user input.
              },
                textInputAction: TextInputAction.next,
                controller: inputuser,
              decoration: kTextFieldDecoration.copyWith(
                  hintText: 'Username / Student #'),

            ),
            SizedBox(
              height: 8.0,
            ),
            TextField( //pw
              onChanged: (value) {
                //Do something with the user input.
              },
              textInputAction: TextInputAction.done,
              controller: inputpw,
              obscureText: true,
              decoration: kTextFieldDecoration.copyWith(hintText: 'Password'),
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(
                    bottom: 5, // Space between underline and text
                  ),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.amberAccent[200],
                        width: 1.5, // Underline thickness
                      ),
                    ),
                  ),
                  child: Text(
                    "New to Umbrella?",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.amberAccent[200],
                        fontSize: 18.0),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 60.0,
            ),
            RoundedButton(
              title: 'Log In',
              colour: Colors.deepPurple[300],
              onPressed: () {
                var done = getinput();
                  Navigator.pushNamed(context, LoginSuccess.id);
                },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(
                    bottom: 5, // Space between underline and text
                  ),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.amberAccent[200],
                        width: 1.5, // Underline thickness
                      ),
                    ),
                  ),
                  child: Text(
                    "Forgot your password?",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.amberAccent[200],
                        fontSize: 18.0),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  bool getinput() {
    var user = inputuser.text;
    var password = inputpw.text;
    inputuser.dispose();
    inputpw.dispose();
    trysignin(user, password);
  }

  Future<bool> trysignin(usertext,passwordtext) async {
    try {
      final FirebaseUser user = (await
      _auth.signInWithEmailAndPassword(
        email: usertext,
        password: passwordtext,
      )
      ).user;
      if (user != null) {
        print('success');
        bool success = true;
      }
      return true;
    } on Exception catch (_) {
      print('failed');
      bool success = false;
      return false;
    }
  }
}

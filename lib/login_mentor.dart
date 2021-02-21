import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mental_health_app/signup.dart';

class Login extends StatelessWidget {
  //controller for textfields
  final textreaderuser = new TextEditingController();
  final textreaderpw = new TextEditingController();
  static const String mentorOrStudent = "Mentor ID";

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        child: ListView(
          children: <Widget>[
            SizedBox(height: 144),
            Center(
              child: RichText(
                text: TextSpan(
                  text: 'Log In',
                  style: TextStyle(fontSize: 36.0, color: Colors.black, fontWeight: FontWeight.bold)
                ),
              ),
            ),
            Padding(
              padding:EdgeInsets.all(14.0),
              child:Center(
                child: TextFormField(
                  textInputAction: TextInputAction.next,
                  onEditingComplete: () => FocusScope.of(context).nextFocus(),
                  controller: textreaderuser,
                  decoration: const InputDecoration(
                    labelText: "Username or $mentorOrStudent"
                  ),
                ),
              )
            ),
            Padding(
                padding:EdgeInsets.all(14.0),
                child:Center(
                  child: TextFormField(
                    textInputAction: TextInputAction.done,
                    controller: textreaderpw,
                    decoration: const InputDecoration(
                        labelText: "Password"
                    ),
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                  ),
                )
            ),
            SizedBox(height: 20),
            Center(
              child: RichText(
                text: TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Signup()));
                    },
                    text: 'Join here!',
                    style: TextStyle(fontSize: 16.0, color: Colors.amber, decoration: TextDecoration.underline)
                ),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: RaisedButton(
                textColor: Colors.white,
                child: Text('Log In',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    )
                ),
                color: Colors.deepPurple,
                onPressed: (){
                  // if get username and password correct then go to home page
                  getdata();
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Signup()));
                  },
              )
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child:Center(
                child: RichText(
                  text: TextSpan(
                    recognizer: TapGestureRecognizer()..onTap = () => print('Forgot Password'), //go to forgot password page
                    text: 'Forgot your Password?',
                    style: TextStyle(fontSize: 16.0, color: Colors.amber, decoration: TextDecoration.underline)
                ),
              ),
            ),
            )
          ],
        ),
      ),
      );
    }
    List getdata(){
      
    }
}
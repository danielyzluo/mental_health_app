/* to be added:
-> logic in for multiple client users
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:mental_health_app/login_mentor.dart';

// ignore: must_be_immutable
class StartPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //UI
        backgroundColor: Colors.blueGrey,
        body: Center(
            child: ListView(
              children: <Widget>[
                SizedBox(height: 144),
                Center(
                    child:RichText(
                      text: TextSpan(
                          text: 'Welcome To Our App',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0, color: Colors.white)),
                    )
                ),
                SizedBox(height: 100),
                Center(
                    child:RichText(
                        text: TextSpan(
                            text: 'Be kind to your mind',
                            style: TextStyle(fontSize: 24.0, color: Colors.amber)
                        )
                    )
                ),
                SizedBox(height: 80),
                Center(
                  child: RaisedButton(
                    textColor: Colors.white,
                    child: Text("I'm a Buddy / Therapist"),
                    color: Colors.deepPurple,
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
                    },
                  ),
                )
              ],
            )
        ),
      );
  }
}
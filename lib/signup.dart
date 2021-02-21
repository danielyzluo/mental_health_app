import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

//textfield controller
final textreader = TextEditingController();
//firebase database
final databaseReference = FirebaseDatabase.instance.reference();

// ignore: must_be_immutable
class Signup extends StatelessWidget {
  int count = 0;//getNumEntries();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Welcome to Flutter'),
        ),
        body: Center(
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    TextField(
                      controller: textreader,
                    ),
                    RaisedButton(
                      onPressed:() {
                        count++;
                        enterdata('login_name',count);
                      },
                      color: Colors.green,
                      child: Text('Click Here To Submit'),)],
                )
            )
        ),
      ),
    );
  }

  void enterdata(field,usercount){
    //read data
    String input = textreader.text;
    print(textreader.text); //print to console
    textreader.clear(); //clear after running
    databaseReference.child('User $usercount').update({field:input});
  }
}
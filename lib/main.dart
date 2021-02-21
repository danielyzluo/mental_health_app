
import 'package:flutter/material.dart';
import 'package:mental_health_app/start.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context){
  return MaterialApp(
    title: 'Mental Health App',
    home: StartPage(),
  );
  }
}
import 'package:flutter/material.dart';

import './home.dart';
import './introslide.dart';
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

Widget selection(){
  if(seen==true)
  return Home();
  else
  return IntroScreen();
}
  bool seen= true;
 @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.redAccent
      ),
      home: selection());
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterApp/EvaluatorPG.dart';
import 'package:flutterApp/widgets.dart';
import 'package:flutterApp/loginPage.dart';


void main() => runApp(MyApp());

// #docregion MyApp
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter layout demo',
        home: LoginPage(), 
    );
  }
}

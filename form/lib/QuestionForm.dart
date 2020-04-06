import 'package:flutter/material.dart';

class Question extends StatelessWidget
{
  @override 
  Widget build(BuildContext context)
  {
      return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        //automaticallyimplyleading takes away back button when using Appbar
        automaticallyImplyLeading: false,
        title: Text(
          'Question',
          style: TextStyle(fontSize: 32),
        ),
        ),
        );
  }
}
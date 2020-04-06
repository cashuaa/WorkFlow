import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'founderform.dart';

class AddFounder extends StatefulWidget
{
  @override 
  AddFounderState createState()
  {
    return AddFounderState();
  }
}

class AddFounderState extends State<AddFounder>
{
  @override
  Widget build(BuildContext context)
  {
    return RaisedButton(
      textColor: Colors.white,
      color: Colors.blue[900],
      onPressed: addFounderPopUp,
      child: Text('Add',
      style: TextStyle(
        fontSize: 20,
        ),
        ),
      );
  }

  void addFounderPopUp()
  {
    SimpleDialog box = SimpleDialog(
      title: Text("Add Founder", textAlign: TextAlign.center,
      ),
      children: <Widget>[
        FounderCustomForm(),
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context)
      {
        return box;
      }
      );
  }
}
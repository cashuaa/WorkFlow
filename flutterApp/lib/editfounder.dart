import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EditFounder extends StatefulWidget
{
  @override 
  EditFounderState createState()
  {
    return EditFounderState();
  }
}

class EditFounderState extends State<EditFounder>
{
  @override
  Widget build(BuildContext context)
  {
    return RaisedButton(
      textColor: Colors.white,
      color: Colors.blue[900],
      onPressed: editFounderPopUp,
      child: Text('Edit',
      style: TextStyle(
        fontSize: 20,
        ),
        ),
      );
  }

  void editFounderPopUp()
  {
    SimpleDialog box = SimpleDialog(
      title: Text("Edit Founder", textAlign: TextAlign.center,
      ),
      // children: <Widget>[
      //   EvalRmvCustomForm(),
      // ],
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
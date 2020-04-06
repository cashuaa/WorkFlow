import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

//No longer going to be used as of 3/29/20
//replaced by founderrmv.dart

class RemoveFounder extends StatefulWidget
{
  @override 
  RemoveFounderState createState()
  {
    return RemoveFounderState();
  }
}

class RemoveFounderState extends State<RemoveFounder>
{
  @override
  Widget build(BuildContext context)
  {
    return RaisedButton(
      textColor: Colors.white,
      color: Colors.blue[900],
      onPressed: rmvFounderPopUp,
      child: Text('Remove',
      style: TextStyle(
        fontSize: 20,
        ),
        ),
      );
  }

  void rmvFounderPopUp()
  {
    SimpleDialog box = SimpleDialog(
      title: Text("Remove Founder", textAlign: TextAlign.center,
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
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'evalform.dart';

class AddEvaluator extends StatefulWidget
{
  @override 
  AddEvaluatorState createState()
  {
    return AddEvaluatorState();
  }
}

class AddEvaluatorState extends State<AddEvaluator>
{
  @override
  Widget build(BuildContext context)
  {
    return RaisedButton(
      textColor: Colors.white,
      color: Colors.blue[900],
      onPressed: addEvalPopUp,
      child: Text('Add',
      style: TextStyle(
        fontSize: 20,
        ),
        ),
      );
  }

  void addEvalPopUp()
  {
    SimpleDialog box = SimpleDialog(
      title: Text("Add Evaluator", textAlign: TextAlign.center,
      ),
      children: <Widget>[
        EvalCustomForm(),
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
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EditEvaluator extends StatefulWidget
{
  @override 
  EditEvaluatorState createState()
  {
    return EditEvaluatorState();
  }
}

class EditEvaluatorState extends State<EditEvaluator>
{
  @override
  Widget build(BuildContext context)
  {
    return RaisedButton(
      textColor: Colors.white,
      color: Colors.blue[900],
      onPressed: editEvalPopUp,
      child: Text('Edit',
      style: TextStyle(
        fontSize: 20,
        ),
        ),
      );
  }

  void editEvalPopUp()
  {
    SimpleDialog box = SimpleDialog(
      title: Text("Edit Evaluator", textAlign: TextAlign.center,
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
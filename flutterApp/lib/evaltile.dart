//Created on: 3/18/2020
//class EvalTile: 
//      Container, for the evaluator, that has interactable cards
//      different operations. The operations are as follows: add, remove, and edit

import 'package:flutter/material.dart';
import 'evalform.dart';

class EvalTile extends StatefulWidget
{
  @override
  EvalTileState createState() {
    return EvalTileState();
  }  
}

class EvalTileState extends State<EvalTile>
{
  @override
  Widget build(BuildContext context)
  {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(8),
    child: Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Text("Evaluator Workshop",
            style: new TextStyle(
              fontSize: 18, 
              fontWeight: FontWeight.bold,
              ),
              ),
          ],
          ),
          Flexible(child: Card(
            child: ListTile(
              onTap: evalAdd,
              leading: Icon(Icons.person,),
              title: Text('Add Evaluator',),
              subtitle: Text('Add a single evaluator',),
              trailing: Icon(Icons.add_circle_outline,),
              ),
              ),
              ),
          Flexible(child: Card(
            child: ListTile(
              onTap: () {}, //add remove functionality here
              leading: Icon(Icons.supervisor_account,),
              title: Text('Remove Evaluator',),
              subtitle: Text('Remove a single or multiple evaluators',),
              trailing: Icon(Icons.remove_circle_outline,),
              ),
              ),
              ),
          Flexible(child: Card(
            child: ListTile(
              onTap: () {}, //add edit functionality here
              leading: Icon(Icons.person,),
              title: Text('Edit Evaluator',),
              subtitle: Text('Change evaluator information',),
              trailing: Icon(Icons.mode_edit,),
              ),
              ),
              ),
      ],
    ),      
    );
  }

  //function: evalAdd
  //          creates a popup dialog box that is used to input the different data fields 
  //          of the evaluator. This data is stored in Googel FireBase
  void evalAdd()
  {
    SimpleDialog box = SimpleDialog(title: Text("Add Evaluator", textAlign: TextAlign.center,), children: <Widget>[EvalCustomForm()],);
    showDialog(context: context, builder: (BuildContext context) { return box; });
  }
}
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class StatsTile extends StatefulWidget {
  @override
  StatsTileState createState() {
    return StatsTileState();
  }
}

class StatsTileState extends State<StatsTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(8),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded( 
                child: Text("Evaluator Workshop",
                    style: new TextStyle(
                      fontWeight: FontWeight.bold,
                    )),
              ),
            ],
          ),
          Flexible(
            child: Card(

              
           
              shadowColor: Colors.blue[900],
              child: ListTile(
                
                leading: Icon(Icons.person,color: Colors.blue[900], ),

                title: Text('Add Evaluator'),

                subtitle: Text('Add a single evaluator'),

                trailing: Icon(Icons.add_circle_outline, color: Colors.blue[900],),
              ),
            ),
          ),
          Flexible(
            child: Card(
              shadowColor: Colors.blue[900],
              child: ListTile(
                leading: Icon(Icons.supervisor_account, color: Colors.blue[900]),
                title: Text('Remove Evaluator'),
                subtitle: Text('Remove a single or multiple evaluators'),
                trailing: Icon(Icons.remove_circle_outline, color: Colors.blue[900],),
              ),
            ),
          ),
          Flexible(
            child: Card(
              shadowColor: Colors.blue[900],
              child: ListTile(
                leading: Icon(Icons.person,color: Colors.blue[900],),
                title: Text('Edit Evaluator'),
                subtitle: Text('Change an evaluator\'s weight'),
                trailing: Icon(Icons.mode_edit,color: Colors.blue[900],),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

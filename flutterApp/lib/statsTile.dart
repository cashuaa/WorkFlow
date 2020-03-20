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
              FittedBox(
                fit: BoxFit.fitWidth,
                child: Text("Evaluator Workshop",
                    style: new TextStyle(
                      fontWeight: FontWeight.bold,
                    )),
              ),
            ],
          ),
          Flexible(
            child: Card(

              
            //  color: Color.fromRGBO(0, 18, 194, 0.15),
              shadowColor: Colors.red,
              child: ListTile(
                
              //   contentPadding: EdgeInsets.symmetric( 
              //   vertical: MediaQuery.of(context).size.height * .4,
              //   horizontal: MediaQuery.of(context).size.width * .4,
              // //MediaQuery.of(context).size.width * 0.02,
              // ),

                leading: Icon(Icons.person),

                title: Text('Add Evaluator'),

                subtitle: Text('Add a single evaluator'),

                trailing: Icon(Icons.add_circle_outline),
              ),
            ),
          ),
          Flexible(
            child: Card(
              shadowColor: Colors.red,
              child: ListTile(
                leading: Icon(Icons.supervisor_account),
                title: Text('Remove Evaluator'),
                subtitle: Text('Remove a single or multiple evaluators'),
                trailing: Icon(Icons.remove_circle_outline),
              ),
            ),
          ),
          Flexible(
            child: Card(
              shadowColor: Colors.red,
              child: ListTile(
                leading: Icon(Icons.person),
                title: Text('Edit Evaluator'),
                subtitle: Text('Change an evaluator\'s weight'),
                trailing: Icon(Icons.mode_edit),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

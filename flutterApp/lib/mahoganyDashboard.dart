import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterApp/statsTile.dart';
import 'evaltile.dart'; //creates the evaluator tile container
import 'foundertile.dart'; //creates the founder tile container
import 'deliverabletile.dart'; //creates the deliverable tile container

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[350],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.red,
        centerTitle: true,
        title:  Text('StartUpNV Dashboard', style: TextStyle(fontSize: 32,)),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.fromLTRB(
              MediaQuery.of(context).size.width * 0.02,
              MediaQuery.of(context).size.width * 0.03,
              MediaQuery.of(context).size.width * 0.02,
              MediaQuery.of(context).size.width * 0.02),
          child: Column(
            children: <Widget>[
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(child: EvalTile()),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.01,),
                    Expanded(child: FounderTile()),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.01,),
                    Expanded(child: DeliverableTile()),
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.width * 0.01,),
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(child: StatsTile()),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.01,),
                    Expanded(child: StatsTile()),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.01,),
                    Expanded(child: StatsTile()),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget tile = Container(
  //   color: Colors.white,
  //   padding: const EdgeInsets.all(8),
  //   child: Column(
  //     children: <Widget>[
  //       Row(
  //         children: <Widget>[
  //           FittedBox(fit:BoxFit.fitWidth,child: Text("Evaluator Workshop",
  //               style:
  //                   new TextStyle(fontWeight: FontWeight.bold,)),),
  //         ],
  //       ),
  //       Flexible(child:Card(
  //         shadowColor: Colors.blue[900],
          

  //         child: ListTile(

  //           contentPadding: EdgeInsets.fromLTRB(
  //             MediaQuery.of(context).size.width * 0.02,
  //             MediaQuery.of(context).size.width * 0.03,
  //             MediaQuery.of(context).size.width * 0.02,
  //             MediaQuery.of(context).size.width * 0.02),

  //           leading: Icon(Icons.person),
  //           title: Text('Add Evaluator'),
  //           subtitle: Text('Add a single evaluator'),
  //           trailing: Icon(Icons.add_circle_outline),
  //         ),
  //       ),),
  //       Flexible(child:Card(
  //         shadowColor: Colors.blue[900],
  //         child: ListTile(
  //           leading: Icon(Icons.supervisor_account),
  //           title: Text('Remove Evaluator'),
  //           subtitle: Text('Remove a single or multiple evaluators'),
  //           trailing: Icon(Icons.remove_circle_outline),
  //         ),
  //       ),),
  //       Flexible(child:Card(
  //         shadowColor: Colors.blue[900],
  //         child: ListTile(
  //           leading: Icon(Icons.person),
  //           title: Text('Edit Evaluator'),
  //           subtitle: Text('Change an evaluator\'s weight'),
  //           trailing: Icon(Icons.mode_edit),
  //         ),
  //         ),),
  //     ],
  //   ),
  // );
}

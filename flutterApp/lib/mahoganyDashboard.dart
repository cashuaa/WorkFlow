import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

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
                    Expanded(child: tile),
                    SizedBox(width: 14),
                    Expanded(child: tile),
                    SizedBox(width: 14),
                    Expanded(child: tile),
                  ],
                ),
              ),
              SizedBox(height: 14),
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(child: tile),
                    SizedBox(width: 14),
                    Expanded(child: tile),
                    SizedBox(width: 14),
                    Expanded(child: tile),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget tile = Container(
    color: Colors.white,
    padding: const EdgeInsets.all(8),
    child: Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Text("Evaluator Workshop",
                style:
                    new TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ],
        ),
        Flexible(child:Card(
          child: ListTile(
            leading: Icon(Icons.person),
            title: Text('Add Evaluator'),
            subtitle: Text('Add a single evaluator'),
            trailing: Icon(Icons.add_circle_outline),
          ),
        ),),
        Flexible(child:Card(
          child: ListTile(
            leading: Icon(Icons.supervisor_account),
            title: Text('Remove Evaluator'),
            subtitle: Text('remove a single or multiple evaluators'),
            trailing: Icon(Icons.remove_circle_outline),
          ),
        ),),
        Flexible(child:Card(
          child: ListTile(
            leading: Icon(Icons.person),
            title: Text('Edit Evaluator'),
            subtitle: Text('Change an evaluator\'s weight'),
            trailing: Icon(Icons.mode_edit),
          ),
          ),),
      ],
    ),
  );
}

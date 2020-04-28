import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterApp/statsTile.dart';
import 'evaltile.dart'; //creates the evaluator tile container
import 'foundertile.dart'; //creates the founder tile container
import 'deliverabletile.dart'; //creates the deliverable tile container
import 'statsMiddleTile.dart';
import 'statsLastTile.dart';

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
        backgroundColor: Colors.blueGrey[900],
        centerTitle: true,
        title: Text(
          'StartUpNV Dashboard',
          style: TextStyle(
            fontSize: 32,
          ),
        ),
        actions: <Widget>[
          FlatButton(
            hoverColor: Colors.blueGrey[700],
            shape: BeveledRectangleBorder(),
            textColor: Colors.white,
            onPressed: () {
              Navigator.pop(context);
            }, //needs to be able to log the person out
            child: Text(
              'Log Out',
              style: TextStyle(
                decoration: TextDecoration.underline,
              ),
            ),
            color: Colors.blueGrey[900],
          )
        ],
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
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.01,
                    ),
                    Expanded(child: FounderTile()),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.01,
                    ),
                    Expanded(child: DeliverableTile()),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.01,
              ),
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(child: StatsTile()),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.01,
                    ),
                    Expanded(child: StatsMiddleTile()),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.01,
                    ),
                    Expanded(child: StatsLastTile()),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

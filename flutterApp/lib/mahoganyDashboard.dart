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
        
        Text("My test Tile!"),
        
      ],
    ),
  );
}

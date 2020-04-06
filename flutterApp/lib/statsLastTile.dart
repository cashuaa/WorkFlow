import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class Statistics {
  int numberOfCompanies = 0;

  Statistics({this.numberOfCompanies});

  factory Statistics.fromJson(Map<String, dynamic> mapForCompanyCount) {
    return Statistics(
      numberOfCompanies: mapForCompanyCount.length,
    );
  }
}

Future<int> fetchStats() async {
  const companiesURL = 'https://projectworkflow.firebaseio.com/Founder.json';

  final companyJsonResponse = await http.get(companiesURL);

  Map<String, dynamic> mapOfFetchedCompanies =
      json.decode(companyJsonResponse.body);

  Statistics statsHolder = new Statistics.fromJson(mapOfFetchedCompanies);

  return (statsHolder.numberOfCompanies);
}

class StatsLastTile extends StatefulWidget {
  @override
  StatsLastTileState createState() {
    return StatsLastTileState();
  }
}

class StatsLastTileState extends State<StatsLastTile> {
  // @override
//////////////////////////////////////////////

  Widget fetchStatz = FutureBuilder<int>(
    future: fetchStats(),
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        return Container(
          child: Text("${snapshot.data}"),
        );
      } else if (snapshot.hasError) {
        return new Text("${snapshot.error}");
      }

      // By default, show a loading spinner
      return new CircularProgressIndicator();
    },
  );

//////////////////////////////////////////////

  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blueGrey[900],
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
      padding: const EdgeInsets.all(8),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text("Number of Companies",
                      style: new TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      )),
                ),
              ),
            ],
          ),
          Flexible(
            child: Text("some chart here", style: TextStyle(color: Colors.white,),),
            //GAUGE CAN GO HERE!
          ),
          Flexible(
            child: Card(
              //shadowColor: Colors.blue[900],
              child: fetchStatz,
            ),
          ),
        ],
      ),
    );
  }
}

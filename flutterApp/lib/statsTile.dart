import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:percent_indicator/percent_indicator.dart';

class Statistics {
  int avgFormScores = 0;

  Statistics({this.avgFormScores});

  factory Statistics.setScroes(dynamic mapForFormCount, int index) {
    return Statistics(
      avgFormScores: mapForFormCount['storedValues'][index],
    );
  }
}

Future<double> fetchStats() async {
  const formURL = 'https://projectworkflow.firebaseio.com/Assessments.json';

  final formJsonResponse = await http.get(formURL);

  Map<String, dynamic> mapOfFetchedForms = json.decode(formJsonResponse.body);

  int overallScoreIndex = 11;
  int tempInt = 0;

  dynamic valuesOfMapOfFetchedForms = mapOfFetchedForms.values;

  print(valuesOfMapOfFetchedForms);

  for (var temp in valuesOfMapOfFetchedForms) {
    Statistics overallScoreHolder =
        new Statistics.setScroes(temp, overallScoreIndex);
    if (overallScoreHolder.avgFormScores != null) {
      tempInt = tempInt + overallScoreHolder.avgFormScores;
    }
  }

  return (tempInt / mapOfFetchedForms.length);
}

class StatsTile extends StatefulWidget {
  @override
  StatsTileState createState() {
    return StatsTileState();
  }
}

class StatsTileState extends State<StatsTile> {
  // @override

  Widget fetchStatz = FutureBuilder<double>(
    future: fetchStats(),
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        return Container(
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircularPercentIndicator(
                    radius: MediaQuery.of(context).size.longestSide * .16,
                    animation: true,
                    animationDuration: 2000,
                    lineWidth: MediaQuery.of(context).size.height * .015,
                    percent: snapshot.data / 5,
                    reverse: false,
                    arcBackgroundColor: Colors.red,
                    arcType: ArcType.HALF,
                    center: Text(
                      "${snapshot.data}",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16.0, color: Colors.white,),
                    ),
                    circularStrokeCap: CircularStrokeCap.round,
                    backgroundColor: Colors.transparent,
                    progressColor: Colors.blue,
                  ),
                ],
              ),
            ],
          ),
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
                  child: Text("Average Score Given", style: TextStyle(color: Colors.white,),),
                ),
              ),
            ],
          ),
          fetchStatz,
        ],
      ),
    );
  }
}

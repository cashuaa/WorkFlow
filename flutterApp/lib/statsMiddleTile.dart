import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class Statistics {
  int numberOfFormsFilled = 0;
  int numberOfEvaluators = 0;
  int numberOfCompanies = 0;
  int avgFormScores = 0;


  Statistics(
      {this.numberOfFormsFilled,
      this.numberOfEvaluators,
      this.numberOfCompanies,
      this.avgFormScores});

  factory Statistics.fromJson(
      Map<String, dynamic> mapForFormCount,
      Map<String, dynamic> mapForEvalCount,
      Map<String, dynamic>
          mapForCompanyCount /*, Map<String, dynamic> mapForScoreAvg*/) {
    return Statistics(
      numberOfFormsFilled: mapForFormCount.length,
      numberOfEvaluators: mapForEvalCount.length,
      numberOfCompanies: mapForCompanyCount.length,
    );
  }

  factory Statistics.setScroes(
     dynamic mapForFormCount, int index) {
    return Statistics(
      avgFormScores: mapForFormCount['storedValues'][index],
    );
  }
}

Future<int> fetchStats() async {
  const formURL = 'https://projectworkflow.firebaseio.com/Assessments.json';
  const evaluatorsURL =
      'https://projectworkflow.firebaseio.com/Evaluators.json';
  const companiesURL = 'https://projectworkflow.firebaseio.com/Founder.json';
  final formJsonResponse = await http.get(formURL);
  final evalJsonResponse = await http.get(evaluatorsURL);
  final companyJsonResponse = await http.get(companiesURL);

  Map<String, dynamic> mapOfFetchedForms = json.decode(formJsonResponse.body);

  Map<String, dynamic> mapOfFetchedEvaluators =
      json.decode(evalJsonResponse.body);
  Map<String, dynamic> mapOfFetchedCompanies =
      json.decode(companyJsonResponse.body);

  Statistics statsHolder = new Statistics.fromJson(
      mapOfFetchedForms, mapOfFetchedEvaluators, mapOfFetchedCompanies);
      
      ////////////////////////////////////////////////////////////////////////
      int overallScoreIndex = 11; 
      int tempInt = 0; 
      
      List<Statistics> listOfScores = new List();
      dynamic valuesOfMapOfFetchedForms = mapOfFetchedForms.values;

      print(valuesOfMapOfFetchedForms);

       for (var temp in valuesOfMapOfFetchedForms) {
        Statistics overallScoreHolder = new Statistics.setScroes(temp, overallScoreIndex);
        if (overallScoreHolder.avgFormScores != null) {
          tempInt = tempInt + overallScoreHolder.avgFormScores; 
         
          listOfScores.add(overallScoreHolder);
          print("\nSCORES: ${overallScoreHolder.avgFormScores} \n");
    }
  }
     
  

  print(
      "number of forms filled: ${statsHolder.numberOfFormsFilled} & number of evaluators: ${statsHolder.numberOfEvaluators} & number of companies: ${statsHolder.numberOfCompanies}\n");
return (statsHolder.numberOfFormsFilled);
}

class StatsMiddleTile extends StatefulWidget {
  @override
  StatsMiddleTileState createState() {
    return StatsMiddleTileState();
  }
}

class StatsMiddleTileState extends State<StatsMiddleTile> {
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
      color: Colors.white,
      padding: const EdgeInsets.all(8),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Text("Number of Forms Filled",
                    style: new TextStyle(
                      fontWeight: FontWeight.bold,
                    )),
              ),
            ],
          ),
          Flexible( child: Text("some chart here"),
            //GAUGE CAN GO HERE!
          ),
         
          Flexible(
            child: Card(
              shadowColor: Colors.blue[900],
              child: fetchStatz,
            ),
          ),
        ],
      ),
    );
  }
}

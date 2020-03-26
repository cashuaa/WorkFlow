import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import './textWidget.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import './questionaireResponse.dart';
import './customRadioButton.dart';
import 'package:flutterApp/widgets.dart';

class Questionaire extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Retrieve Text Input',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

Map map = {
  'pitchName': 'Pitch Name',
  'firstName': 'First Name',
  'lastName': 'Last Name',
  'email': 'Email',
  'productKnowledge': '(Optional) Product Knowledge: Empty',
  'productFeasability': '(Optional) Product Feasability: Empty',
  'marketKnowledge': '(Optional) Market Knowledge: Empty',
  'marketEducationAbility': '(Optional) Market Education: Empty',
  'customerPersonaKnowledge': '(Optional) Customer Persona Knowledge: Empty',
  'customerBuyExecution': '(Optional) Customer Buy Execution: Empty',
  'competitionKnowledge': '(Optional) Competition Knowledge: Empty',
  'competitionExecution': '(Optional) Competition Execution: Empty',
  'founderExperienceInMarket': '(Optional) Founder Experience In Market: Empty',
  'founderBusinessExperience': '(Optional) Founder Business Experience: Empty',
  'founderCoachableFounder': '(Optional) Founder Coachable Founder: Empty',
  'overall': '(Optional) Overall: Empty',
  'feedbackForFounder': '(Optional) Feedback For Founder: Empty',
  'internalFeedback': '(Optional) Internal Feedback: Empty',
  'storedValues': new List(20),
};

final List<int> recordedValues = new List(20);

void setValue(int index, int newValue) {
  map['storedValues'][index] = newValue;
  print("Map at storedValues index [$index] is ${map['storedValues'][index]}");
}

void setOutput(String destination, String host) {
  map[destination] = host;
}

class _MyHomePageState extends State<MyHomePage> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final productKnowledgeController = TextEditingController();
  final productFeasabilityController = TextEditingController();
  final marketKnowledgeController = TextEditingController();
  final marketEducationAbilityController = TextEditingController();
  final customerPersonaKnowledgeController = TextEditingController();
  final customerBuyExecutionController = TextEditingController();
  final competitionKnowledgeController = TextEditingController();
  final competitionExecutionController = TextEditingController();
  final founderExperienceInMarketController = TextEditingController();
  final founderBusinessExperienceController = TextEditingController();
  final founderCoachableFounderController = TextEditingController();
  final overallController = TextEditingController();
  final feedbackForFounderController = TextEditingController();
  final internalFeedbackController = TextEditingController();
  final inputText = "Please rate from 1-5";
  var pitchName = 'pitchNameHere';

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    productKnowledgeController.dispose();
    productFeasabilityController.dispose();
    marketKnowledgeController.dispose();
    marketEducationAbilityController.dispose();
    customerPersonaKnowledgeController.dispose();
    customerBuyExecutionController.dispose();
    competitionKnowledgeController.dispose();
    competitionExecutionController.dispose();
    founderExperienceInMarketController.dispose();
    founderBusinessExperienceController.dispose();
    founderCoachableFounderController.dispose();
    overallController.dispose();
    feedbackForFounderController.dispose();
    internalFeedbackController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    Future<void> addAssessment() {
      const url = 'https://projectworkflow.firebaseio.com/Assessments.json';
      return http.post(
        url,
        body: json.encode(
          {
            'pitchName': pitchName,
            'firstName': firstNameController.text,
            'lastName': lastNameController.text,
            'email': emailController.text,
            'productKnowledge': productKnowledgeController.text,
            'productFeasability': productFeasabilityController.text,
            'marketKnowledge': marketKnowledgeController.text,
            'marketEducationAbility': marketEducationAbilityController.text,
            'customerPersonaKnowledge': customerPersonaKnowledgeController.text,
            'customerBuyExecution': customerBuyExecutionController.text,
            'competitionKnowledge': competitionKnowledgeController.text,
            'competitionExecution': competitionExecutionController.text,
            'founderExperienceInMarket':
                founderExperienceInMarketController.text,
            'founderBusinessExperience':
                founderBusinessExperienceController.text,
            'founderCoachableFounder': founderCoachableFounderController.text,
            'overall': overallController.text,
            'feedbackForFounder': feedbackForFounderController.text,
            'internalFeedback': internalFeedbackController.text,
          },
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          pitchName,
          style: TextStyle(fontSize: 35),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(
            screenSize.width * 0.10,
            10,
            screenSize.width * 0.10,
            10,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: MyImageWidget(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Flexible(
                    child: TextField(
                      textAlign: TextAlign.center,
                      controller: firstNameController,
                      decoration:
                          const InputDecoration(helperText: "First name"),
                    ),
                  ),
                  Flexible(
                    child: TextField(
                      textAlign: TextAlign.center,
                      controller: lastNameController,
                      decoration:
                          const InputDecoration(helperText: "Last name"),
                    ),
                  ),
                  Flexible(
                    child: TextField(
                      textAlign: TextAlign.center,
                      controller: emailController,
                      decoration:
                          const InputDecoration(helperText: "Email on file"),
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Divider(
                      indent: 40,
                      endIndent: 40,
                      color: Colors.red,
                      height: 80,
                      thickness: 1.0,
                    ),
                  ),
                  Text(
                    'The Product',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      indent: 40,
                      endIndent: 40,
                      color: Colors.red,
                      height: 80,
                      thickness: 1.0,
                    ),
                  ),
                ],
              ),
              textClass(
                'Knowledge',
              ),
              Response(0, 'productKnowledge'),
              textClass(
                'Feasability',
              ),
              Response(1, 'productFeasability'),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Divider(
                      indent: 40,
                      endIndent: 40,
                      color: Colors.red,
                      height: 80,
                      thickness: 1.0,
                    ),
                  ),
                  Text(
                    'The Market',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      indent: 40,
                      endIndent: 40,
                      color: Colors.red,
                      height: 80,
                      thickness: 1.0,
                    ),
                  ),
                ],
              ),
              textClass(
                'Knowledge',
              ),
              Response(2, 'marketKnowledge'),
              textClass(
                'Education Ability',
              ),
              Response(3, 'marketExecutionAbility'),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Divider(
                      indent: 40,
                      endIndent: 40,
                      color: Colors.red,
                      height: 80,
                      thickness: 1.0,
                    ),
                  ),
                  Text(
                    'Customer Questions',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      indent: 40,
                      endIndent: 40,
                      color: Colors.red,
                      height: 80,
                      thickness: 1.0,
                    ),
                  ),
                ],
              ),
              textClass(
                'Knowledge',
              ),
              Response(4, 'customerPersonaKnowledge'),
              textClass(
                'Execution',
              ),
              Response(5, 'customerBuyExecution'),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Divider(
                      indent: 40,
                      endIndent: 40,
                      color: Colors.red,
                      height: 80,
                      thickness: 1.0,
                    ),
                  ),
                  Text(
                    'The Competition',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      indent: 40,
                      endIndent: 40,
                      color: Colors.red,
                      height: 80,
                      thickness: 1.0,
                    ),
                  ),
                ],
              ),
              textClass(
                'Knowledge',
              ),
              Response(6, 'competitionKnowledge'),
              textClass(
                'Execution',
              ),
              Response(7, 'competitionExecution'),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Divider(
                      indent: 40,
                      endIndent: 40,
                      color: Colors.red,
                      height: 80,
                      thickness: 1.0,
                    ),
                  ),
                  Text(
                    'The Team',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      indent: 40,
                      endIndent: 40,
                      color: Colors.red,
                      height: 80,
                      thickness: 1.0,
                    ),
                  ),
                ],
              ),
              textClass(
                'Knowledge',
              ),
              Response(8, 'founderExperienceInMarket'),
              textClass(
                'Execution',
              ),
              Response(9, 'founderBusinessExperience'),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Divider(
                      indent: 40,
                      endIndent: 40,
                      color: Colors.red,
                      height: 80,
                      thickness: 1.0,
                    ),
                  ),
                  Text(
                    'The Founder',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      indent: 40,
                      endIndent: 40,
                      color: Colors.red,
                      height: 80,
                      thickness: 1.0,
                    ),
                  ),
                ],
              ),
              textClass(
                'Founder Coachable Founder',
              ),
              Response(10, 'founderCoachableFounder'),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Divider(
                      indent: 40,
                      endIndent: 40,
                      color: Colors.red,
                      height: 80,
                      thickness: 1.0,
                    ),
                  ),
                  Text(
                    'Overall',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      indent: 40,
                      endIndent: 40,
                      color: Colors.red,
                      height: 80,
                      thickness: 1.0,
                    ),
                  ),
                ],
              ),
              textClass(
                'Overall',
              ),
              Response(11, 'overall'),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Divider(
                      indent: 40,
                      endIndent: 40,
                      color: Colors.red,
                      height: 80,
                      thickness: 1.0,
                    ),
                  ),
                  Text(
                    'Feedback',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      indent: 40,
                      endIndent: 40,
                      color: Colors.red,
                      height: 80,
                      thickness: 1.0,
                    ),
                  ),
                ],
              ),
              textClass(
                'External',
              ),
              TextField(
                controller: feedbackForFounderController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Please leave feedback for the founder [external]",
                ),
                maxLines: null,
                textAlign: TextAlign.center,
              ),
              textClass(
                'Internal',
              ),
              TextField(
                controller: internalFeedbackController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Please leave feedback for the founder [internal]",
                ),
                maxLines: null,
                textAlign: TextAlign.center,
              ),
              RaisedButton(
                onPressed: () {
                  map['feedbackForFounder'] = feedbackForFounderController.text;
                  map['internalFeedback'] = internalFeedbackController.text;
                  map['storedValues'] = recordedValues;

                  // Nick Function here
                  addAssessment();

                  return showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        // Retrieve the text the that user has entered by using the
                        // TextEditingController.
                        content: Text(map['pitchName'] +
                            '\n' +
                            map['firstName'] +
                            '\n' +
                            map['lastName'] +
                            '\n' +
                            map['email'] +
                            '\n' +
                            map['productKnowledge'] +
                            '\n' +
                            map['productFeasability'] +
                            '\n' +
                            map['marketKnowledge'] +
                            '\n' +
                            map['marketEducationAbility'] +
                            '\n' +
                            map['customerPersonaKnowledge'] +
                            '\n' +
                            map['customerBuyExecution'] +
                            '\n' +
                            map['competitionKnowledge'] +
                            '\n' +
                            map['competitionExecution'] +
                            '\n' +
                            map['founderExperienceInMarket'] +
                            '\n' +
                            map['founderBusinessExperience'] +
                            '\n' +
                            map['founderCoachableFounder'] +
                            '\n' +
                            map['overall'] +
                            '\n' +
                            map['feedbackForFounder'] +
                            '\n' +
                            map['internalFeedback']),
                            //'\n' +
                            //map['storedValues'].text),
                            
                      );
                    },
                  );
                },
                child: Text('Submit'),
              )
            ],
          ),
        ),
      ),
    );
  }
}

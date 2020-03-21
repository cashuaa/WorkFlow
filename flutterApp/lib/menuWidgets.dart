import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/rendering.dart';
import 'pdfPage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class StartupNames {
  String startupName;

  StartupNames({this.startupName});

  factory StartupNames.fromJson(dynamic value) {
    return StartupNames(
      startupName: value['firstName'],
    );
  }
}

Future<List<StartupNames>> fetchRandomFormNames() async {
  const url = 'https://projectworkflow.firebaseio.com/Assessments.json';
  final response = await http.get(url);
  Map<String, dynamic> evaluations = json.decode(response.body);

  dynamic onlyValues = evaluations.values; //Map consists of Key and Value

  print(onlyValues);
  print("---------json decoded map above-------");

  List<StartupNames> startups = manipulateValue(onlyValues); //still have to iterate

  print("-------THESE ARE VALUES---------");
  for (var plzWork in startups) {
    print(plzWork.startupName);
  }
  return startups;
}

List<StartupNames> manipulateValue(dynamic value) {
  List<StartupNames> list = new List();
  
  for (var v in value) {
    StartupNames startupInfo = new StartupNames.fromJson(v);
    if (startupInfo.startupName != null) {
      list.add(startupInfo);
    }
  }

  print("Read values--------------------");
  for (var instancer in list) {
    print(instancer.startupName);
  }

  return list;
}

class PDFMaker extends StatefulWidget {
  @override
  PDFMakerState createState() {
    return PDFMakerState();
  }
}

class PDFMakerState extends State<PDFMaker> {

  Widget loadedStartupNames = FutureBuilder<List<StartupNames>>(
    future: fetchRandomFormNames(),
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        print("HAS DATA DELETE ME");
        return Container(
          height: MediaQuery.of(context).size.height * .3,
          width: MediaQuery.of(context).size.width * .3,
          child: new ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              print(snapshot.data.length);
              for (var temp in snapshot.data) {
                print(temp.startupName);
              }

              return new Column(
                   children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        new Icon(
                          Icons.business,
                        ),
                        new Text(snapshot.data[index].startupName,
                            style: new TextStyle(
                              fontWeight: FontWeight.bold,
                            )),
                        new Icon(
                          Icons.check_box_outline_blank,
                        ),
                      ],
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.0075 ),
                    // new Divider(
                    //   height: 2.0,
                    //   color: Colors.blue[900],
                    // ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.0075 ),
                  ]);
            },
            
          ),
        );
      } else if (snapshot.hasError) {
        return new Text("${snapshot.error}");
      }

      // By default, show a loading spinner
      return new CircularProgressIndicator();
    },
  );

  void pdfPopUp() {

    SimpleDialog dialog = SimpleDialog(
      title: Text("Choose StartUp"),
      children: <Widget>[
        loadedStartupNames,
      ],
    );

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return dialog;
        });
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Card(
        child: ListTile(
          onTap: pdfPopUp, //add remove functionality here
          leading: Icon(
            Icons.picture_as_pdf,
          ),
          title: Text(
            'Process PDF',
          ),
          subtitle: Text(
            'Process analytics and send out PDF',
          ),
          trailing: Icon(
            Icons.publish,
          ),
        ),
      ),
    );
  }
}

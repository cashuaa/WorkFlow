import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'pdfPage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class StartupNames {
  String startupName; 

  StartupNames({this.startupName});

factory StartupNames.fromJson(dynamic value){
    return StartupNames(
      
      startupName: value['firstName'],
    );
  }
}

 
 Future <List<StartupNames>> fetchRandomFormNames() async {

   const url = 'https://projectworkflow.firebaseio.com/Assessments.json';
   final response = await http.get(url);
   Map<String, dynamic> evaluations = json.decode(response.body);
   

   
 
  dynamic onlyValues = evaluations.values;

  print( onlyValues );
  print ("---------json decoded-------");

    List<StartupNames> startups = manipulateValue(onlyValues); //still have to iterate
  // evaluations.forEach((k, v) => manipulateValue(v, founderNames));
    print("-------THESE ARE VALUES---------");
  for(var plzWork in startups){print(plzWork.startupName);}
    return startups; 
 }



List<StartupNames>  manipulateValue(dynamic value) {
 List <StartupNames> list = new List();
  for(var v in value){
  StartupNames startupInfo = new StartupNames.fromJson(v);
  list.add(startupInfo);
  }
  print("Read values--------------------");
  for(var instancer in list){print(instancer.startupName);}
  // StartupNames startupInfo = new StartupNames.fromJson(value);
  // list.add(startupInfo);

  //print(startupInfo.startupName);
  return list;
}



////////////////////////////////////////////////////////////////////////////////////////
class PDFMaker extends StatefulWidget {
  @override
  PDFMakerState createState() {
    return PDFMakerState();
  }
}


class PDFMakerState extends State<PDFMaker> {
//CAN ADD functions in here

//////////////Firebase fetch///////////////////////


Widget loadedStartupNames = FutureBuilder<List<StartupNames>>(
      future: fetchRandomFormNames(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          print("HAS DATA DELETE ME");
          return Container(
            width: 400,
            height: 400,
            child: new ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                
                
                print(snapshot.data.length);
                for (var temp in snapshot.data){
                  print( temp.startupName);
                }

                
                return new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    
                    children: <Widget>[
                      
                      new Text(snapshot.data[index].startupName,
                          style: new TextStyle(fontWeight: FontWeight.bold)),
                      new Divider()
                    ]);
                    
              },
            // shrinkWrap: true,
            ),
          );
        } else if (snapshot.hasError) {
          return new Text("${snapshot.error}");
        }

        // By default, show a loading spinner
        return new CircularProgressIndicator();
      },
    );






//////////////End of firebase fetch////////////////

  void PDFpopUp() {
    Widget optionONE = SimpleDialogOption(
      child: Row(
        children: [
          Icon(
            Icons.check_box_outline_blank,
            color: Colors.lightBlue,
          ),
          Padding(
            padding: EdgeInsets.only(
                left: 10), //creates space between icon and company name
            child: Text("Sexy Kitchen"),
          ),
        ],
      ),
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => PdfViewerPage()));
        //process one pdf here, but for multiple
        //we will need to use more modular tactics for the list of startups
        //and create a set so they can be saved in
        //We should add checkbox for multi select indicator
        //so if unique startup in list is found in saved set,
        //we then can be able to allow functionality for unmarking the checkbox
        //Similar to this: https://github.com/flutter/codelabs/blob/master/startup_namer/step6_add_interactivity/lib/main.dart
      },
    );

    Widget optionTWO = SimpleDialogOption(
      child: Row(
        children: [
          Icon(
            Icons.check_box_outline_blank,
            color: Colors.lightBlue,
          ),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text("Gabe's StartUp"),
          ),
        ],
      ),
      onPressed: () {

        

      },
    );

    SimpleDialog dialog = SimpleDialog(
      title: Text("Choose StartUp"),
      children: <Widget>[
      //  optionONE,
      // optionTWO,
      
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
    return Container(
      child: Container(
        child: SizedBox(
          width: 100,
          child: RaisedButton(
              textColor: Colors.white,
              color: Colors.blue[900],
              onPressed: PDFpopUp,
              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment.center, // Centers children in row
                children: [
                  Text('PDF'),
                  SizedBox(width: 5), //creates a space in between text and icon
                  Icon(
                    Icons.picture_as_pdf,
                    color: Colors.red,
                  ),
                ],
              )),
        ),
      ),
    );
  }
}

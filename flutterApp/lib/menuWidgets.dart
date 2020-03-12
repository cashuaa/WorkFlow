import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'pdfPage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Startups {
  String companyName;

  Startups({this.companyName});
}



Future<List<Startups>> fetchStartups() async {
  const url = 'https://projectworkflow.firebaseio.com/Startups.json';
  final response = await http.get(url);
  List dataBaseStringResponse = json.decode(response.body.toString());
  List<Startups> startupList = createStartupNameList(dataBaseStringResponse);

  return startupList;
}

List<Startups> createStartupNameList(List data) {
  List<Startups> list = new List();

  for (int i = 0; i < data.length; i++) {
   // print(data[i]+'\n');
   print(data[i]["name"]);
    String tempName = data[i]["name"];
    Startups tempObject = new Startups(companyName: tempName);
    list.add(tempObject);
   // String startupName = data[i]["name"];
  //  Startups singleName = new Startups(companyName: startupName);
  //  list.add(singleName);
  }
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
Widget loadedStartupNames = FutureBuilder<List<Startups>>(
  
  future: fetchStartups(),
  builder: (context, snapshot) {
    if (snapshot.hasData) {
      return new ListView.builder(
        itemCount: snapshot.data.length,
        itemBuilder: (context, index) {
          return new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text(snapshot.data[index].companyName,
                    style: new TextStyle(fontWeight: FontWeight.bold)),
                new Divider()
              ]);
        },
        //shrinkWrap: true,
      );
    } else if (snapshot.hasError) {
      return new Text("${snapshot.error}");
    }
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
      onPressed: () {},
    );

    SimpleDialog dialog = SimpleDialog(
      title: Text("Choose StartUp"),
      children: <Widget>[
       // optionONE,
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

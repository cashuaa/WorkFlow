//Created on: 3/18/2020
//class DeliverableTile: 
//      Container, for the deliverables, that has interactable cards
//      different operations. The operations are as follows: invite and send PDF

import 'package:flutter/material.dart';
import 'questionaire.dart';

class DeliverableTile extends StatefulWidget
{
  @override
  DeliverableTileState createState() {
    return DeliverableTileState();
  }  
}

class DeliverableTileState extends State<DeliverableTile>
{
  @override
  Widget build(BuildContext context)
  {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(8),
    child: Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Text("Deliverable Workshop",
            style: new TextStyle(
              fontSize: 18, 
              fontWeight: FontWeight.bold,
              ),
              ),
          ],
          ),
          Flexible(child: Card(
            child: ListTile(
              onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) => Questionaire()));},
              leading: Icon(Icons.mail,),
              title: Text('Invite Evaluator',),
              subtitle: Text('Send invitation to evaluators',),
              trailing: Icon(Icons.forward,),
              ),
              ),
              ),
          Flexible(child: Card(
            child: ListTile(
              onTap: () {}, //add remove functionality here
              leading: Icon(Icons.picture_as_pdf,),
              title: Text('Process PDF',),
              subtitle: Text('Process analytics and send out PDF',),
              trailing: Icon(Icons.publish,),
              ),
              ),
              ),
          // Flexible(child: Card(
          //   child: ListTile(
          //     onTap: () {}, //add edit functionality here
          //     leading: Icon(Icons.supervisor_account,),
          //     title: Text('Edit Founder',),
          //     subtitle: Text('Change founder information',),
          //     trailing: Icon(Icons.mode_edit,),
          //     ),
          //     ),
          //     ),
      ],
    ),      
    );
  }

  void popTest()
  {
    SimpleDialog box = SimpleDialog(title: Text("Add Founder", textAlign: TextAlign.center,),);
    showDialog(context: context, builder: (BuildContext context) { return box; });
  }
}
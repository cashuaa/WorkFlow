//Created on: 3/18/2020
//class FounderTile and FounderTileState:
//      Container, for the founder, that has interactable cards
//      different operations. The operations are as follows: add, remove, and edit
//Updated: 3/30/20 - added in editing and removing functions for the founder tile - JM

import 'package:flutter/material.dart';
import 'founderform.dart';
import 'foundrmv.dart';
import 'founderedit.dart';

class FounderTile extends StatefulWidget {
  @override
  FounderTileState createState() {
    return FounderTileState();
  }
}

class FounderTileState extends State<FounderTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(8),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(
                "Founder Workshop",
                style: new TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Flexible(
            child: Card(
              child: ListTile(
                onTap: founderAdd,
                leading: Icon(
                  Icons.person,
                ),
                title: Text(
                  'Add Founder',
                ),
                subtitle: Text(
                  'Add a single founder',
                ),
                trailing: Icon(
                  Icons.add_circle_outline,
                ),
              ),
            ),
          ),
          Flexible(
            child: Card(
              child: ListTile(
                onTap: removeFounder, //add remove functionality here
                leading: Icon(
                  Icons.supervisor_account,
                ),
                title: Text(
                  'Remove Founder',
                ),
                subtitle: Text(
                  'Remove a single or multiple founders',
                ),
                trailing: Icon(
                  Icons.remove_circle_outline,
                ),
              ),
            ),
          ),
          Flexible(
            child: Card(
              child: ListTile(
                onTap: editFounder, //add edit functionality here
                leading: Icon(
                  Icons.person,
                ),
                title: Text(
                  'Edit Founder',
                ),
                subtitle: Text(
                  'Change founder information',
                ),
                trailing: Icon(
                  Icons.mode_edit,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  //function: founderAdd
  //          creates a popup dialog box that is used to input the company name
  //          of the founder. This data is stored in Google FireBase
  void founderAdd() {
    SimpleDialog box = SimpleDialog(
      title: Text(
        "Add Founder",
        textAlign: TextAlign.center,
      ),
      children: <Widget>[
        FounderCustomForm(),
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return box;
      },
    );
  }

  //function: removeFounder
  //          removes the choosen founder from the database in Google FireBase
  void removeFounder() {
    SimpleDialog box = SimpleDialog(
      title: Text(
        "Remove Founder",
        textAlign: TextAlign.center,
      ),
      children: <Widget>[FounderRemove()],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return box;
      },
    );
  }

  //function: editFounder
  //          brings up a dialog box with prefilled data that can be edited, changes are pushed up to the database
  void editFounder() {
    SimpleDialog box = SimpleDialog(
      title: Text(
        "Edit Founder",
        textAlign: TextAlign.center,
      ),
      children: <Widget>[FounderEdit()],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return box;
      },
    );
  }
}

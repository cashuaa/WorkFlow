import 'package:flutter/material.dart';
import './customRadioButton.dart';

class Response extends StatefulWidget {
  int index;
  String outputText;
  Response(this.index, this.outputText, {Key key})
      : super(key: key);
  @override
  _ResponseState createState() =>
      _ResponseState(index, outputText);
}

class _ResponseState extends State<Response> {
  int index;
  String outputText;
  _ResponseState(this.index, this.outputText);
  @override
  Widget build(BuildContext context) {
    final newController = TextEditingController();
    return Row(
      children: <Widget>[
        CustomRadioButton(index),
        Flexible(
          child: Container(
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.10,
            ),
            child: TextField(
              controller: newController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Optional comments',
              ),
              maxLines: null,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}

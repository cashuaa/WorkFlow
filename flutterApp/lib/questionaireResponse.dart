import 'package:flutter/material.dart';
import './customRadioButton.dart';


class Response extends StatefulWidget {
  @override
  _ResponseState createState() => _ResponseState();
}

class _ResponseState extends State<Response> {
  @override
  Widget build(BuildContext context) {
    final newController = TextEditingController();
    return Row(
      children: <Widget>[
        CustomRadioButton(),
        Flexible(
          child: TextField(
            controller: newController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'this is a test',
            ),
            maxLines: null,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}

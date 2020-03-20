import 'package:flutter/material.dart';

class CustomRadioButton extends StatefulWidget {
  @override
  _CustomRadioButtonState createState() => _CustomRadioButtonState();
}

class _CustomRadioButtonState extends State<CustomRadioButton> {
  var tempValue = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Radio(
          value: 1,
          groupValue: tempValue,
          activeColor: Colors.red,
          onChanged: (val) {
            setState(() {
              tempValue = val;
            });
          },
        ),
        Radio(
          value: 2,
          groupValue: tempValue,
          activeColor: Colors.red,
          onChanged: (val) {
            setState(() {
              tempValue = val;
            });
          },
        ),
        Radio(
          value: 3,
          groupValue: tempValue,
          activeColor: Colors.red,
          onChanged: (val) {
            setState(() {
              tempValue = val;
            });
          },
        ),
        Radio(
          value: 4,
          groupValue: tempValue,
          activeColor: Colors.red,
          onChanged: (val) {
            setState(() {
              tempValue = val;
            });
          },
        ),
        Radio(
          value: 5,
          groupValue: tempValue,
          activeColor: Colors.red,
          onChanged: (val) {
            setState(() {
              tempValue = val;
            });
          },
        ),
      ],
    );
  }
}

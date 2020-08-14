import 'package:flutter/material.dart';

class SelectRM extends StatefulWidget {
  @override
  _SelectRMState createState() => _SelectRMState();
}

class _SelectRMState extends State<SelectRM> {
  String selected;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: DropdownButton<String>(
            hint: Text("Select item"),
            value: selected,
            onChanged: (value) {
              setState(() {
                selected = value;
              });
            },
            items: <String>['2°RM', '11°RM'].map((String value) {
              return new DropdownMenuItem<String>(
                value: value,
                child: new Text(value),
              );
            }).toList()));
  }
}

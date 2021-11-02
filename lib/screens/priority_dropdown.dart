// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

String chosenPriority = '';

class PriorityTodos extends StatefulWidget {
  const PriorityTodos({Key? key}) : super(key: key);

  @override
  _PriorityTodosState createState() => _PriorityTodosState();
}

class _PriorityTodosState extends State<PriorityTodos> {
  List<DropdownMenuItem<String>> menuItems = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DropdownButton(
          underline: Container(),
          isExpanded: true,
          items: const [
            DropdownMenuItem(
              value: 'high',
              child: Text('High'),
            ),
            DropdownMenuItem(
              value: 'Medium',
              child: Text('Medium'),
            ),
            DropdownMenuItem(
              value: 'Low',
              child: Text('Low'),
            ),
          ],
          onChanged: (value) {
            setState(() {
              chosenPriority = value as String;
            });
          },
          hint: Text('Select Your Priority'),
        ),
        Text(chosenPriority),
      ],
    );
  }
}

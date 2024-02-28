import 'dart:core';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class GoalSetting extends StatefulWidget {
  const GoalSetting({
    super.key,
  });

  @override
  State<GoalSetting> createState() => _GoalSettingState();
}

class _GoalSettingState extends State<GoalSetting> {
  String buttonText = ' Set your Goal here';

  late String currentDate;

  @override
  void initState() {
    super.initState();
    updateTime();
  }

  void updateTime() {
    setState(() {
      currentDate = DateFormat('MMMM dd, yyyy').format(DateTime.now());
    });
  }
  
 
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            const Text(
              'Goal',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              '$currentDate',
              style: TextStyle(
                color: Colors.black.withOpacity(0.5),
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
            
          ],
        ),
        
        ElevatedButton(
          onPressed: () {
            _showChangeTextDialog(context);
          },
          child: Text(
            buttonText,
            // style: TextStyle(
            //     color: Colors.white
            //     ),
          ),
        ),
      ],
    );
  }

  void _showChangeTextDialog(BuildContext context) {
  TextEditingController textEditingController = TextEditingController();

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Enter your Amount'),
        content: TextField(
          controller: textEditingController,
          decoration: InputDecoration(labelText: 'Amount'),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                buttonText = textEditingController.text;
              });
              Navigator.of(context).pop();
            },
            child: Text('Save'),
          ),
        ],
      );
    },
  );
}

}

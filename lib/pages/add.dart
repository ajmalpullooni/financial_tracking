import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class AddUser extends StatefulWidget {
  const AddUser({Key? key}) : super(key: key);

  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  final CollectionReference person = FirebaseFirestore.instance.collection('users');

  TextEditingController personamount = TextEditingController();
  TextEditingController persondescription = TextEditingController();
  TextEditingController dateText = TextEditingController();

  void addDonor() {
    final data = {
      'amount': personamount.text,
      'description': persondescription.text,
      'date': dateText.text,
    };
    person.add(data);
  }

  

  @override
  void initState() {
    dateText.text = DateFormat('dd-MM-yyyy').format(DateTime.now());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Doners'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            TextField(
              controller: personamount,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text('Amount'),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: persondescription,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text('Description'),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: dateText,
              readOnly: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text('Date'),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                addDonor();
                Navigator.pop(context);
              },
              style: ButtonStyle(
                backgroundColor: const MaterialStatePropertyAll(Colors.blue),
                minimumSize: MaterialStateProperty.all(
                  Size(
                    double.infinity,
                    50,
                  ),
                ),
              ),
              child: Text('Submit'),
            ),
            SizedBox(
              height: 20,
            ),
            
          ],
        ),
      ),
    );
  }
}

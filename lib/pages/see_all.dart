import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TransactionList extends StatefulWidget {
  const TransactionList({super.key});

  @override
  State<TransactionList> createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  final CollectionReference person =
      FirebaseFirestore.instance.collection('users');

  void deleteDonoor(docId) {
    person.doc(docId).delete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transactions'),
        backgroundColor: Colors.blue,
      ),
      body: StreamBuilder(
        stream: person.snapshots(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data?.docs.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot donorSnap = snapshot.data.docs[index];
                
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey, blurRadius: 20, spreadRadius: 5)
                      ],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.green[500],
                          child: Text(
                            donorSnap['amount'].toString(),
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text(
                          donorSnap['description'].toString(),
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          donorSnap['date'].toString(),
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                        IconButton(
                          onPressed: () {
                            deleteDonoor(donorSnap.id);
                          },
                          icon: Icon(
                            Icons.delete,
                            size: 20,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
          return Container();
        },
      ),
    );
  }
}

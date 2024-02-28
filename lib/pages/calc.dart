
import 'package:cloud_firestore/cloud_firestore.dart';

  Future<int> totalSum() async {
      CollectionReference access = FirebaseFirestore.instance.collection('users');
      QuerySnapshot querySnapshot = await access.get();

      int sum = 0;
      querySnapshot.docs.forEach((doc) {
        // int calc = doc['amount'] ?? 0;
        int calc = int.tryParse(doc['amount'] ?? '0') ?? 0;
        sum = sum + calc;
      });
      return sum;
    }
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseServices {
  FirebaseFirestore firestore = FirebaseFirestore.instance;


  Future<void> addNewAssistant(String name, String phoneNumber, String email, String password) async {
    // if (name.isEmpty) {
    //   throw ArgumentError('Pharmacy name must not be empty');
    // }

    await firestore.collection('assistants').add({
      'name': name,
      'phoneNumber':phoneNumber,
      'email': email,
      'password':password,
      'createdAt': FieldValue.serverTimestamp(),
    });
  }
}
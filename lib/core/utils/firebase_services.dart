import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseServices {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> addNewAssistant(
      String name, String phoneNumber, String email, String password) async {
    await firestore.collection('assistants').add({
      'name': name,
      'phoneNumber': phoneNumber,
      'email': email,
      'password': password,
      'createdAt': FieldValue.serverTimestamp(),
    });
  }

  Stream<QuerySnapshot> getAssistants() {
    return firestore.collection('assistants').orderBy('createdAt').snapshots();
  }

  Future<void> deleteAssistant(String assistantId) async {
    await firestore.collection('assistants').doc(assistantId).delete();
  }
}

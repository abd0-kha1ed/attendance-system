import 'package:attendance/feature/home/data/models/add_lecture_model.dart';
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
    return firestore
        .collection('assistants')
        .orderBy('createdAt', descending: true)
        .snapshots();
  }

  Future<void> deleteAssistant(String assistantId) async {
    await firestore.collection('assistants').doc(assistantId).delete();
  }

  Future<void> addNewStudent(String code, String name, String phoneNumber,
      String parentPhoneNumber, String studentId) async {
    await firestore.collection('lectures').doc(studentId).collection('students').add({
      'code': code,
      'name': name,
      'phoneNumber': phoneNumber,
      'parentPhoneNumber': parentPhoneNumber,
      'createdAt': FieldValue.serverTimestamp(),
    });
  }

  Stream<QuerySnapshot> getStudent(String studentId) {
    return firestore
    .collection('lectures')
    .doc(studentId)
        .collection('students')
        .orderBy('createdAt', descending: true)
        .snapshots();
  }

  Future<void> updateStudent(
    String code,
    String name,
    String phoneNumber,
    String parentPhoneNumber,
    String studentId,
  ) async {
    await firestore.collection('students').doc(studentId).update({
      'code': code,
      'name': name,
      'phoneNumber': phoneNumber,
      'parentPhoneNumber': parentPhoneNumber,
    });
  }

  Future<void> deleteStudent(String studentId) async {
    await firestore.collection('students').doc(studentId).delete();
  }

  Future<void> addStudentFeature(
    String code,
    String name,
  ) async {
    await firestore.collection('features').add({
      'code': code,
      'name': name,
      'createdAt': FieldValue.serverTimestamp(),
    });
  }

  Stream<QuerySnapshot> getStudentFeature() {
    return firestore
        .collection('features')
        .orderBy('createdAt', descending: true)
        .snapshots();
  }


  
Future<void> addLectureData(
  String grade,
  String region,
  int studentCount,
  DateTime lectureTime,
) async {
  CollectionReference lecturesRef = firestore.collection('lectures');

  await lecturesRef.add({
    'grade': grade,
    'region': region,
    'studentCount': studentCount,
    'lectureTime': lectureTime,
  });
}

  Stream<List<AddLectureModel>> getLecturesByRegion(String region) {
    return firestore
        .collection('lectures') 
        .where('region', isEqualTo: region)
        .snapshots() 
        .map((snapshot) {
          return snapshot.docs
              .map((doc) => AddLectureModel.fromMap(doc.data()))
              .toList();
        });
  }

  Future<void> deleteFeatureStudent(String studentId) async {
    await firestore.collection('features').doc(studentId).delete();
  }
}



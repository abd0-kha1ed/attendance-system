import 'package:cloud_firestore/cloud_firestore.dart';

class StudentModel {
  String code;
  String name;
  String phoneNumber;
  String parentPhoneNumber;
  final String studentId;

  StudentModel({
    required this.code,
    required this.name,
    required this.phoneNumber,
    required this.parentPhoneNumber,
    required this.studentId,
  });

  Map<String, dynamic> toMap() {
    return {
      'code': code,
      'name': name,
      'phoneNumber': phoneNumber,
      'parentPhoneNumber': parentPhoneNumber,
      'studentId': DateTime.now().toString(),
      'createdAt': FieldValue.serverTimestamp(),
    };
  }

  factory StudentModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return StudentModel(
      code: json['code'],
      name: json['name'],
      phoneNumber: json['phoneNumber'] ?? '',
      parentPhoneNumber: json['parentPhoneNumber'] ?? '',
      studentId: json['studentId'] ?? '',
    );
  }
}

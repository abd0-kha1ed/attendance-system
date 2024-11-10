import 'package:cloud_firestore/cloud_firestore.dart';

class LectureModel {
  final String id;
  final DateTime? time;
  final int studentCount;
  final String startingDay;
  final String grade;
  final String region;
  final DateTime? createdAt;

  LectureModel({
    required this.id,
    required this.time,
    required this.studentCount,
    required this.startingDay,
    required this.grade,
    required this.region,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id, // Store the existing id instead of generating a new one
      'lectureTime': time != null ? Timestamp.fromDate(time!) : null,
      'totalCount': studentCount,
      'startingDay': startingDay,
      'grade': grade,
      'region': region,
      'createdAt': createdAt != null ? Timestamp.fromDate(createdAt!) : null,
    };
  }

  factory LectureModel.fromMap(Map<String, dynamic> map, String documentId) {
    return LectureModel(
      id: documentId, // Use the document ID from Firestore
      time: map['lectureTime'] != null
          ? (map['lectureTime'] as Timestamp).toDate()
          : null,
      studentCount: map['totalCount'] ?? 0,
      startingDay: map['startingDay'] ?? '',
      grade: map['grade'] ?? '',
      region: map['region'] ?? '',
      createdAt: map['createdAt'] != null
          ? (map['createdAt'] as Timestamp).toDate()
          : null,
    );
  }
}

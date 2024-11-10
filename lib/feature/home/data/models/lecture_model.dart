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
      'lectureTime': time != null ? Timestamp.fromDate(time!) : null,
      'totalCount': studentCount,
      'startingDay': startingDay,
      'grade': grade,
      'region': region,
      'createdAt': createdAt != null ? Timestamp.fromDate(createdAt!) : null,
      'id': DateTime.now().microsecond.toString(),
    };
  }

  factory LectureModel.fromMap(Map<String, dynamic> map) {
    return LectureModel(
      id: map['id'],
      time: map['lectureTime'] != null
          ? (map['lectureTime'] as Timestamp).toDate()
          : null,
      studentCount: map['totalCount'] is int ? map['totalCount'] : 10,
      startingDay: map['startingDay'] ?? '',
      grade: map['grade'] ?? '',
      region: map['region'] ?? '',
      createdAt: map['createdAt'] != null
          ? (map['createdAt'] as Timestamp).toDate()
          : null,
    );
  }
}

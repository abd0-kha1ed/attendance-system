import 'package:cloud_firestore/cloud_firestore.dart';

class LectureModel {
  final String? id;
  final DateTime time;
  final int studentCount;
  final String startingDay;
  final DateTime createdAt;

  LectureModel({
    this.id,
    required this.time,
    required this.studentCount,
    required this.startingDay,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'time': time,
      'studentCount': studentCount,
      'startingDay': startingDay,
      'createdAt': createdAt,
    };
  }

  factory LectureModel.fromMap(Map<String, dynamic> map, String id) {
    return LectureModel(
      id: id,
      time: (map['time'] as Timestamp).toDate(),
      studentCount: map['studentCount'] ?? 0,
      startingDay: map['startingDay'] ?? 'Saturday',
      createdAt: (map['createdAt'] as Timestamp).toDate(),
    );
  }
}

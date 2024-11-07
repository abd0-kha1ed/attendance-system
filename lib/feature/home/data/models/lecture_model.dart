import 'package:cloud_firestore/cloud_firestore.dart';

class LectureModel {
  final String? id;
  final DateTime? time;
  final int studentCount;
  final String startingDay;
  final String grade;
  final String region;
  final DateTime? createdAt;

  LectureModel({
    this.id,
    required this.time,
    required this.studentCount,
    required this.startingDay,
    required this.grade,
    required this.region,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'time': time != null ? Timestamp.fromDate(time!) : null,
      'studentCount': studentCount,
      'startingDay': startingDay,
      'grade': grade,
      'region': region,
      'createdAt': createdAt != null ? Timestamp.fromDate(createdAt!) : null,
    };
  }

  factory LectureModel.fromMap(Map<String, dynamic> map, String id) {
    print("Map data for lecture: $map");
    return LectureModel(
      id: id,
      time: map['time'] != null ? (map['time'] as Timestamp).toDate() : null,
      studentCount: map['studentCount'] is int ? map['studentCount'] as int : 0,
      startingDay: map['startingDay'] ?? '',
      grade: map['grade'] ?? '',
      region: map['region'] ?? '',
      createdAt: map['createdAt'] != null ? (map['createdAt'] as Timestamp).toDate() : null,
    );
  }
}

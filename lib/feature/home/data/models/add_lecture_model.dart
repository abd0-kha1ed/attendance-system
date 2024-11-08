class AddLectureModel {
  final String id;
  final String name;
  final String grade;
  final String region;
  final String lectureTime;

  AddLectureModel({
    required this.id,
    required this.name,
    required this.grade,
    required this.region,
    required this.lectureTime,
  });

  factory AddLectureModel.fromMap(Map<String, dynamic> map) {
    return AddLectureModel(
      id: map['id'],
      name: map['name'],
      grade: map['grade'],
      region: map['region'],
      lectureTime: map['lectureTime'],
    );
  }
}

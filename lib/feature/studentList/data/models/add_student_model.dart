class AddNewStudentModel {
   String code;
   String name;
   String phoneNumber;
   String parentPhoneNumber;
  final String studentId;

  AddNewStudentModel(
      {required this.code,
      required this.name,
      required this.phoneNumber,
      required this.parentPhoneNumber,
      required this.studentId});
  factory AddNewStudentModel.fromjson(Map<String, dynamic> jsonData) {
    return AddNewStudentModel(
      code: jsonData['code'] ?? 'Unnamed Pharmacy',
      name: jsonData['name'] ?? 'Unknown ID',
      phoneNumber: jsonData['phoneNumber'] ?? 'Unnamed Pharmacy',
      parentPhoneNumber: jsonData['parentPhoneNumber'] ?? 'Unnamed Pharmacy',
      studentId: jsonData['id'] ?? 'Unnamed Pharmacy',
    );
  }
}

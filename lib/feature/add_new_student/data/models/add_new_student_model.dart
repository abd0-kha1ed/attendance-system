class AddNewStudentModel {
  final int code;
  final String name;
  final int phoneNumber;
  final int parentPhoneNumber;
  final String addNewStudentId;

  AddNewStudentModel(
      {required this.code,
      required this.name,
      required this.phoneNumber,
      required this.parentPhoneNumber,
      required this.addNewStudentId});
  factory AddNewStudentModel.fromjson(Map<String, dynamic> jsonData) {
    return AddNewStudentModel(
      code: jsonData['code'] ?? 'Unnamed Pharmacy',
      name: jsonData['name'] ?? 'Unknown ID',
      phoneNumber: jsonData['phoneNumber'] ?? 'Unnamed Pharmacy',
      parentPhoneNumber: jsonData['parentPhoneNumber'] ?? 'Unnamed Pharmacy',
      addNewStudentId: jsonData['addNewStudentId'] ?? 'Unnamed Pharmacy',
    );
  }
}

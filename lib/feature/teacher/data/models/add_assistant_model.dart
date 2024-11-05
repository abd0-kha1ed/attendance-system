class AddAssistantModel {
  final String name;
  final String email;
  final String password;
  final String assistantId;
  final String phoneNumber;

  AddAssistantModel(
      {
      required this.password,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.assistantId
  });

  factory AddAssistantModel.fromJson(Map<String, dynamic> jsonData) {
    return AddAssistantModel(
      name: jsonData['name'] ?? 'Unnamed Pharmacy',
      assistantId: jsonData['id'] ?? 'Unknown ID',
      email: jsonData['email'] ?? 'Unnamed Pharmacy',
      password: jsonData['password'] ?? 'Unnamed Pharmacy',
      phoneNumber: jsonData['phoneNumber'] ?? 'Unnamed Pharmacy',
    );
  }
}

class AppUser {
  final String uid;
  final String name;
  final String email;

  AppUser({required this.uid, required this.name, required this.email});

  Map<String, dynamic> tojson() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
    };
  }

  factory AppUser.formjson(jsonuser) {
    return AppUser(
      uid: jsonuser['uid'],
      email: jsonuser['email'],
      name: jsonuser['name'],
    );
  }
}

import 'package:attendance/feature/login/data/models/app_user.dart';
import 'package:attendance/feature/login/data/repo/auth_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthRepo implements AuthRepo {
  @override
  Future<AppUser?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      //! attemp sign in
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
//! create user
      AppUser user =
          AppUser(uid: userCredential.user!.uid, name: '', email: email);
//! return user
      return user;
    } catch (e) {
      //! catch an error
      throw Exception('Login failed:$e');
    }
  }

  @override
  Future<void> logout() async {
    //! attemp log out
    await FirebaseAuth.instance.signOut();
  }

  @override
  Future<AppUser?> registerWithEmallPassWord(
      String name, String email, String password) async {
    try {
      //! attemp sign up
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
//! create user
      AppUser user =
          AppUser(uid: userCredential.user!.uid, name: '', email: email);
//! return user
      return user;
    } catch (e) {
      //! catch an error
      throw Exception('Login failed:$e');
    }
  }

  @override
  Future<AppUser?> getcurrrentUser() async {
    //! get current loggid in fure base
    final firbaseUser = FirebaseAuth.instance.currentUser;

    //! no user Logged in
    if (firbaseUser == null) {
      return null;
    }
    //! user exist
    return AppUser(
      uid: firbaseUser.uid,
      name: '',
      email: firbaseUser.email!,
    );
  }
}

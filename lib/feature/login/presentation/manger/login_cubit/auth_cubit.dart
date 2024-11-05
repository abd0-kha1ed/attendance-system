import 'package:attendance/feature/login/data/models/app_user.dart';
import 'package:attendance/feature/login/data/repo/auth_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepo authRepo;
  AppUser? currentUser;
  AuthCubit({required this.authRepo}) : super(AuthInitialState());
//! check if user areadly authintacated
  void checkAuth() async {
    final AppUser? user = await authRepo.getcurrrentUser();
    if (user != null) {
      emit(AuthenticatedState(user));
    } else {
      emit(UnAuthenticatedState());
    }
  }
  //! get current user

  AppUser? get currentuser => currentUser;

  //!login with email and password
  Future<void> login(String email, String password) async {
    try {
      emit(AuthLoadingState());
      final user = await authRepo.signInWithEmailAndPassword(email, password);
      if (user != null) {
        currentUser = user;
        emit(AuthenticatedState(user));
      } else {
        emit(UnAuthenticatedState());
      }
    } catch (e) {
      emit(AuthErrorState(e.toString()));
      emit(UnAuthenticatedState());
    }
  }

  //! Register with email and password
  Future<void> register(String email, String password, String name) async {
    try {
      emit(AuthLoadingState());
      final user =
          await authRepo.registerWithEmallPassWord(name, email, password);
      if (user != null) {
        currentUser = user;
        emit(AuthenticatedState(user));
      } else {
        emit(UnAuthenticatedState());
      }
    } catch (e) {
      emit(AuthErrorState(e.toString()));
      emit(UnAuthenticatedState());
    }
  }

//!logout
  Future<void> logout() async {
    authRepo.logout();
    emit(UnAuthenticatedState());
  }
}

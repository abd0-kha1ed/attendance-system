part of 'auth_cubit.dart';

abstract class AuthState {}

//! initial state
final class AuthInitialState extends AuthState {}

//! loading state
final class AuthLoadingState extends AuthState {}

//! authintaced State
final class AuthenticatedState extends AuthState {
  final AppUser user;

  AuthenticatedState(this.user);
}

//! unathunticated State
final class UnAuthenticatedState extends AuthState {}

//! error State
final class AuthErrorState extends AuthState {
  final String errMessage;

  AuthErrorState(this.errMessage);
}

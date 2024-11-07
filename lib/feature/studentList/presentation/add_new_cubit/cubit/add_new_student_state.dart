part of 'add_new_student_cubit.dart';

@immutable
sealed class AddNewStudentState {}

final class AddNewStudentInitial extends AddNewStudentState {}

final class AddNewStudentLoading extends AddNewStudentState {}

final class AddNewStudentSuccess extends AddNewStudentState {}

final class AddNewStudentFail extends AddNewStudentState {
  final String errorMessage;

  AddNewStudentFail({required this.errorMessage});
}

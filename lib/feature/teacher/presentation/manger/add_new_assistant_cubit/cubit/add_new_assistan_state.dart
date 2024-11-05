part of 'add_new_assistan_cubit.dart';

abstract class AddNewAssistanState {}

class AddNewAssistanInitial extends AddNewAssistanState {}

class AddNewAssistantLoading extends AddNewAssistanState {}

class AddNewAssistanSuccess extends AddNewAssistanState {}

class AddNewAssistanFail extends AddNewAssistanState {
  final String errorMessage;

  AddNewAssistanFail(this.errorMessage);
}

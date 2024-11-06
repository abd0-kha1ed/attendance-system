part of 'add_new_assistan_cubit.dart';

abstract class AddNewAssistantState {}

class AddNewAssistanInitial extends AddNewAssistantState {}

class AddNewAssistantLoading extends AddNewAssistantState {}

class AddNewAssistanSuccess extends AddNewAssistantState {}

class AddNewAssistanFail extends AddNewAssistantState {
  final String errorMessage;

  AddNewAssistanFail({required this.errorMessage});
}

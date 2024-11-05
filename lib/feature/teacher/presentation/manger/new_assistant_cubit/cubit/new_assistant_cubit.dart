import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'new_assistant_state.dart';

class NewAssistantCubit extends Cubit<NewAssistantState> {
  NewAssistantCubit() : super(NewAssistantInitial());
}

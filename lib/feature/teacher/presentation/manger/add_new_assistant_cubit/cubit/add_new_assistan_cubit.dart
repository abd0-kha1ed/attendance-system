import 'package:attendance/feature/teacher/data/models/add_assistant_model.dart';
// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';

part 'add_new_assistan_state.dart';

class AddNewAssistanCubit extends Cubit<AddNewAssistanState> {
  AddNewAssistanCubit() : super(AddNewAssistanInitial());

  void addnewassistnat(AddAssistantModel addnew) async {
    emit(AddNewAssistantLoading());

    try {
      emit(AddNewAssistanSuccess());
    } catch (e) {
      emit(
        AddNewAssistanFail(
          errorMessage: e.toString(),
        ),
      );
    }
  }
}

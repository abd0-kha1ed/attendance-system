import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'add_new_assistan_state.dart';

class AddNewAssistanCubit extends Cubit<AddNewAssistanState> {
  AddNewAssistanCubit() : super(AddNewAssistanInitial());
}

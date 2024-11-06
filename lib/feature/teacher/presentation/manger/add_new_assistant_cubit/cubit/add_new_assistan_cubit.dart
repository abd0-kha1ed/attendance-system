import 'package:attendance/core/utils/firebase_services.dart';

// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'add_new_assistan_state.dart';

class AddNewAssistantCubit extends Cubit<AddNewAssistantState> {
  AddNewAssistantCubit() : super(AddNewAssistanInitial());
  final FirebaseServices firebaseServices = FirebaseServices();
  Future<void> addNewAssistant(
      {required String name,
      required String phoneNumber,
      required String email,
      required String password}) async {
    emit(AddNewAssistantLoading());

    try {
      await firebaseServices.addNewAssistant(
          name, phoneNumber, email, password);
      emit(AddNewAssistanSuccess());
    } on FirebaseException catch (e) {
      throw Exception(e.toString());
    } catch (e) {
      emit(
        AddNewAssistanFail(
          errorMessage: e.toString(),
        ),
      );
    }
  }
}

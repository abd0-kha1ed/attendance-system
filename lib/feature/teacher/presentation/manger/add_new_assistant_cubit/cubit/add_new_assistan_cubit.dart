import 'package:attendance/core/utils/firebase_services.dart';

// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';

part 'add_new_assistan_state.dart';

class AddNewAssistanCubit extends Cubit<AddNewAssistanState> {
  AddNewAssistanCubit() : super(AddNewAssistanInitial());
  final FirebaseServices firebaseServices = FirebaseServices();
  Future<void> addnewassistnat(
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

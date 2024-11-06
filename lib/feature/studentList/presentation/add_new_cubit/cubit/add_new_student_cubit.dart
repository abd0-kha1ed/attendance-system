import 'package:attendance/core/utils/firebase_services.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'add_new_student_state.dart';

class AddNewStudentCubit extends Cubit<AddNewStudentState> {
  AddNewStudentCubit() : super(AddNewStudentInitial());
  final FirebaseServices firebaseServices = FirebaseServices();
  Future<void> addNewStudent({
    required String code,
    required String name,
    required String phoneNumber,
    required String parentPhoneNumber,
  }) async {
    emit(AddNewStudentLoading());

    try {
      await firebaseServices.addNewStudent(
        code,
        name,
        phoneNumber,
        parentPhoneNumber,
      );
      emit(AddNewStudentSuccess());
    } on FirebaseException catch (e) {
      throw Exception(e.toString());
    } catch (e) {
      emit(
        AddNewStudentFail(
          errorMessage: e.toString(),
        ),
      );
    }
  }

  Future<void> addStudentFeature({
    required String code,
    required String name,
    required String studentId,
  }) async {
    emit(AddNewStudentLoading());

    try {
      await firebaseServices.addStudentFeature(
        code,
        name,
        studentId,
      );
      emit(AddNewStudentSuccess());
    } on FirebaseException catch (e) {
      throw Exception(e.toString());
    } catch (e) {
      emit(
        AddNewStudentFail(
          errorMessage: e.toString(),
        ),
      );
    }
  }
}

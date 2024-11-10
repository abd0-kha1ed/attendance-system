import 'package:attendance/core/utils/firebase_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'add_new_student_state.dart';

class AddNewStudentCubit extends Cubit<AddNewStudentState> {
  AddNewStudentCubit() : super(AddNewStudentInitial());
  final FirebaseServices firebaseServices = FirebaseServices();

  Future<void> addNewStudent(
    String lectureId,
    String name,
    String code,
    String phoneNumber,
    String parentPhoneNumber,
  ) async {
    emit(AddNewStudentLoading());

    try {
      await firebaseServices.addNewStudent(
          lectureId, code, name, phoneNumber, parentPhoneNumber);
      emit(AddNewStudentSuccess());
    } catch (e) {
      emit(AddNewStudentFail(errorMessage: e.toString()));
    }
  }

  Future<void> addStudentFeature(
      {required String code,
      required String name,
      required String lectureId,
      required String studentId}) async {
    emit(AddNewStudentLoading());

    try {
      await firebaseServices.addStudentFeature(code, name, lectureId);
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

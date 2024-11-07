import 'package:attendance/feature/home/data/models/lecture_model.dart';
import 'package:attendance/feature/home/presentation/manger/add_lecture_cubit/add_lecture_cubit_state.dart';
// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddLectureCubit extends Cubit<AddLectureState> {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  AddLectureCubit()
      : super(AddLectureState(
          selectedTime: DateTime.now(),
          selectedCount: 1,
          selectedDayIndex: 0,
        ));

  void updateSelectedTime(DateTime time) {
    emit(state.copyWith(selectedTime: time));
  }

  void updateSelectedCount(int count) {
    emit(state.copyWith(selectedCount: count));
  }

  void updateSelectedDayIndex(int index) {
    emit(state.copyWith(selectedDayIndex: index));
  }

  Future<void> addLectureData() async {
    try {
      final lecture = LectureModel(
        time: state.selectedTime,
        studentCount: state.selectedCount,
        startingDay: state.selectedDayIndex == 0 ? 'Saturday' : 'Monday',
        createdAt: DateTime.now(),
      );

      final docRef = await FirebaseFirestore.instance
          .collection('lectures')
          .add(lecture.toMap());

      // ignore: unused_local_variable
      final lectureModel = LectureModel(
        id: docRef.id,
        time: lecture.time,
        studentCount: lecture.studentCount,
        startingDay: lecture.startingDay,
        createdAt: lecture.createdAt,
      );
    } catch (e) {
      // print("Error saving lecture data: $e");
    }
  }

  Future<List<LectureModel>> fetchLectures() async {
    try {
      final querySnapshot =
          await firebaseFirestore.collection('lectures').get();
      return querySnapshot.docs
          .map((doc) => LectureModel.fromMap(doc.data(), doc.id))
          .toList();
    } catch (e) {
      // print("Error fetching lectures: $e");
      return [];
    }
  }
}

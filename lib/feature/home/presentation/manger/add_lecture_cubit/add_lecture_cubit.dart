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
          selectedCount: 0,
          selectedDayIndex: 0,
          grade: '1st Prep',
          region: 'Abo hamad',
        ));

  void updateSelectedTime(DateTime time) {
    emit(state.copyWith(selectedTime: time));
  }

  void updateStudentCount(int count) {
    emit(state.copyWith(selectedCount: count));
  }

  void updateStartingDay(int index) {
    emit(state.copyWith(selectedDayIndex: index));
  }

  void updateGrade(String grade) {
    emit(state.copyWith(grade: grade));
  }

  void updateRegion(String region) {
    emit(state.copyWith(region: region));
  }

  Future<void> addLectureData(
      String grade, String region, int totalCount, DateTime lectureTime) async {
    LectureModel lectureModel = LectureModel(
        id: DateTime.now().microsecond.toString(),
        time: lectureTime,
        studentCount: totalCount,
        startingDay: state.selectedDayIndex == 01 ? 'Saturday' : 'Sunday',
        grade: grade,
        region: region,
        createdAt: DateTime.now());

    try {
      await firebaseFirestore.collection('lectures').add(lectureModel.toMap());
      emit(state.copyWith());
    } catch (error) {
      // print('Error adding lecture: $error');
    }
  }

  // Future<void> updateLectureData(String lectureId, String region,
  //     int totalCount, DateTime lectureTime, String grade) async {
  //   LectureModel lectureModel = LectureModel(
  //     id: lectureId,
  //     time: lectureTime,
  //     studentCount: totalCount,
  //     startingDay: state.selectedDayIndex == 01 ? 'Saturday' : 'Sunday',
  //     grade: grade,
  //     region: region,
  //     createdAt: DateTime.now(),
  //   );
  //   await firebaseFirestore
  //       .collection('lectures')
  //       .doc(lectureId)
  //       .update(lectureModel.toMap());
  // }

// Future<List<LectureModel>> fetchLectures() async {
//   try {
//     final querySnapshot =
//         await firebaseFirestore.collection('lectures').get();
//     return querySnapshot.docs
//         .map((doc) => LectureModel.fromMap(doc.data(), doc.id))
//         .toList();
//   } catch (e) {
//     print("Error fetching lectures: $e");
//     return [];
//   }
// }
}

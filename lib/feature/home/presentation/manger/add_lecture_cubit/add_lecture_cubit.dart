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
    final lectureData = {
      'grade': grade,
      'region': region,
      'totalCount': totalCount,
      'lectureTime': lectureTime,
      'startingDay': state.selectedDayIndex == 0
          ? 'Saturday'
          : 'Sunday', // Optional: store starting day
    };

    try {
      await firebaseFirestore.collection('lectures').add(lectureData);
      emit(state.copyWith());
    } catch (error) {
      // print('Error adding lecture: $error');
    }
  }

<<<<<<< HEAD
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
=======
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
>>>>>>> 0588c4bdf5f29627cb89145dbd5486ea95feae5f
}

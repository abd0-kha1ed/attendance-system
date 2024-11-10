import 'package:attendance/feature/home/data/models/lecture_model.dart';
import 'package:attendance/feature/home/presentation/manger/get%20lecture/get_lecture_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetLectureCubit extends Cubit<GetLectureState> {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  GetLectureCubit() : super(DataLoading());

  void streamLectures({required String region}) {
    emit(DataLoading());

    firebaseFirestore
        .collection('lectures')
        .where('region', isEqualTo: region)
        .snapshots()
        .listen((snapshot) {
      List<LectureModel> lectures = snapshot.docs.map((doc) {
        return LectureModel.fromMap(doc.data());
      }).toList();

      emit(DataLoaded(lectures));
    }, onError: (error) {
      emit(DataError(error.toString()));
    });
  }

 
}

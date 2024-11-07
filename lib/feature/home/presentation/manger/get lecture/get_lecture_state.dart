import 'package:attendance/feature/home/data/models/lecture_model.dart';
import 'package:equatable/equatable.dart';

abstract class GetLectureState extends Equatable {
  @override
  List<Object> get props => [];
}

class DataLoading extends GetLectureState {}

class DataLoaded extends GetLectureState {
  final List<LectureModel> data;

   DataLoaded(this.data);

  @override
  List<Object> get props => [data];
}

class DataError extends GetLectureState {
  final String message;

   DataError(this.message);

  @override
  List<Object> get props => [message];
}

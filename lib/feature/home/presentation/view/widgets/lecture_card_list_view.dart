import 'package:attendance/feature/home/data/models/lecture_model.dart';
import 'package:attendance/feature/home/presentation/manger/get%20lecture/get_lecture_cubit.dart';
import 'package:attendance/feature/home/presentation/manger/get%20lecture/get_lecture_state.dart';
import 'package:attendance/feature/home/presentation/view/widgets/lecture_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LectureCardListView extends StatefulWidget {
  const LectureCardListView({super.key, required this.region});
  final String region;

  @override
  State<LectureCardListView> createState() => _LectureCardListViewState();
}

class _LectureCardListViewState extends State<LectureCardListView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetLectureCubit, GetLectureState>(
      builder: (context, state) {
        if (state is DataLoading) {
          return const Center();
        } else if (state is DataError) {
          return Center(child: Text('Error: ${state.message}'));
        } else if (state is DataLoaded) {
          List<LectureModel> lectures = state.data;

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.region,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  height: 130,
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: lectures.length,
                    itemBuilder: (context, index) {
                      return LectureCard(
                        lecture: lectures[index],
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}

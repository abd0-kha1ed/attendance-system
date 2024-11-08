import 'package:attendance/feature/home/presentation/manger/get%20lecture/get_lecture_cubit.dart';
import 'package:attendance/feature/home/presentation/view/widgets/lecture_card_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllLectureListView extends StatelessWidget {
  const AllLectureListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      fit: FlexFit.loose,
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: BlocProvider(
              create: (_) =>
                  GetLectureCubit()..streamLectures(region: 'Abo hamad'),
              child: const LectureCardListView(region: 'Abo hamad'),
            ),
          ),
          SliverToBoxAdapter(
            child: BlocProvider(
              create: (_) =>
                  GetLectureCubit()..streamLectures(region: 'Zagazig'),
              child: const LectureCardListView(region: 'Zagazig'),
            ),
          ),
          SliverToBoxAdapter(
            child: BlocProvider(
              create: (_) =>
                  GetLectureCubit()..streamLectures(region: '10th of ramadan'),
              child: const LectureCardListView(region: '10th of ramadan'),
            ),
          ),
          SliverToBoxAdapter(
            child: BlocProvider(
              create: (_) =>
                  GetLectureCubit()..streamLectures(region: 'Dyarb negm'),
              child: const LectureCardListView(region: 'Dyarb negm'),
            ),
          ),
          SliverToBoxAdapter(
            child: BlocProvider(
              create: (_) =>
                  GetLectureCubit()..streamLectures(region: 'Minya el Qamh'),
              child: const LectureCardListView(region: 'Minya el Qamh'),
            ),
          ),
          SliverToBoxAdapter(
            child: BlocProvider(
              create: (_) =>
                  GetLectureCubit()..streamLectures(region: 'Almogaze'),
              child: const LectureCardListView(region: 'Almogaze'),
            ),
          ),
          SliverToBoxAdapter(
            child: BlocProvider(
              create: (_) =>
                  GetLectureCubit()..streamLectures(region: 'Shnbara'),
              child: const LectureCardListView(region: 'Shnbara'),
            ),
          ),
        ],
      ),
    );
  }
}

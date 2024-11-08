import 'package:attendance/core/widgets/custom_snack_bar.dart';
import 'package:attendance/feature/home/presentation/manger/get%20lecture/get_lecture_cubit.dart';
import 'package:attendance/feature/home/presentation/manger/get%20lecture/get_lecture_state.dart';
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
                  GetLectureCubit()..fetchLectures(region: 'Abo hamad'),
              child: BlocListener<GetLectureCubit, GetLectureState>(
                  listener: (context, state) {
                    if (state is DataLoaded) {
  showSnackBar(context, 'rebuild success');
}
                  },
                  child: const LectureCardListView(region: 'Abo hamad')),
            ),
          ),
          SliverToBoxAdapter(
            child: BlocProvider(
              create: (_) =>
                  GetLectureCubit()..fetchLectures(region: 'Zagazig'),
              child: BlocListener<GetLectureCubit, GetLectureState>(
                listener: (context, state) {
                  if (state is DataLoaded) {
  showSnackBar(context, 'rebuild success');
}
                },
                child: const LectureCardListView(region: 'Zagazig'),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: BlocProvider(
              create: (_) =>
                  GetLectureCubit()..fetchLectures(region: '10th of ramadan'),
              child: BlocListener<GetLectureCubit, GetLectureState>(
                  listener: (context, state) {
                    if (state is DataLoaded) {
  showSnackBar(context, 'rebuild success');
}
                  },
                  child: const LectureCardListView(region: '10th of ramadan')),
            ),
          ),
          SliverToBoxAdapter(
            child: BlocProvider(
              create: (_) =>
                  GetLectureCubit()..fetchLectures(region: 'Dyarb negm'),
              child: BlocListener<GetLectureCubit, GetLectureState>(
                listener: (context, state) {
                  if (state is DataLoaded) {
  showSnackBar(context, 'rebuild success');
}
                },
                child: const LectureCardListView(region: 'Dyarb negm'),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: BlocProvider(
              create: (_) =>
                  GetLectureCubit()..fetchLectures(region: 'Minya el Qamh'),
              child: BlocListener<GetLectureCubit, GetLectureState>(
                listener: (context, state) {
                  if (state is DataLoaded) {
  showSnackBar(context, 'rebuild success');
}
                },
                child: const LectureCardListView(region: 'Minya el Qamh'),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: BlocProvider(
              create: (_) =>
                  GetLectureCubit()..fetchLectures(region: 'Almogaze'),
              child: BlocListener<GetLectureCubit, GetLectureState>(
                listener: (context, state) {
                    if (state is DataLoaded) {
  showSnackBar(context, 'rebuild success');
}
                  },
                child: const LectureCardListView(region: 'Almogaze'),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: BlocProvider(
              create: (_) =>
                  GetLectureCubit()..fetchLectures(region: 'Shnbara'),
              child: BlocListener<GetLectureCubit,GetLectureState>(
                listener: (context, state) {
                    if (state is DataLoaded) {
  showSnackBar(context, 'rebuild success');
}
                  },
                child: const LectureCardListView(region: 'Shnbara')),
            ),
          ),
        ],
      ),
    );
  }
}

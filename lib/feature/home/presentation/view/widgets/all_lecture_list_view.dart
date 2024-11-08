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
<<<<<<< HEAD
                  GetLectureCubit()..fetchLectures(region: 'Abo hamad'),
              child: BlocListener<GetLectureCubit, GetLectureState>(
                  listener: (context, state) {
                    if (state is DataLoaded) {
  showSnackBar(context, 'rebuild success');
}
                  },
                  child: const LectureCardListView(region: 'Abo hamad')),
=======
                  GetLectureCubit()..streamLectures(region: 'Abo hamad'),
              child: const LectureCardListView(region: 'Abo hamad'),
>>>>>>> 9b8c90f2e2ac13f3bbb8f6ef3e222035fa10d21e
            ),
          ),
          SliverToBoxAdapter(
            child: BlocProvider(
              create: (_) =>
<<<<<<< HEAD
                  GetLectureCubit()..fetchLectures(region: 'Zagazig'),
              child: BlocListener<GetLectureCubit, GetLectureState>(
                listener: (context, state) {
                  if (state is DataLoaded) {
  showSnackBar(context, 'rebuild success');
}
                },
                child: const LectureCardListView(region: 'Zagazig'),
              ),
=======
                  GetLectureCubit()..streamLectures(region: 'Zagazig'),
              child: const LectureCardListView(region: 'Zagazig'),
>>>>>>> 9b8c90f2e2ac13f3bbb8f6ef3e222035fa10d21e
            ),
          ),
          SliverToBoxAdapter(
            child: BlocProvider(
              create: (_) =>
<<<<<<< HEAD
                  GetLectureCubit()..fetchLectures(region: '10th of ramadan'),
              child: BlocListener<GetLectureCubit, GetLectureState>(
                  listener: (context, state) {
                    if (state is DataLoaded) {
  showSnackBar(context, 'rebuild success');
}
                  },
                  child: const LectureCardListView(region: '10th of ramadan')),
=======
                  GetLectureCubit()..streamLectures(region: '10th of ramadan'),
              child: const LectureCardListView(region: '10th of ramadan'),
>>>>>>> 9b8c90f2e2ac13f3bbb8f6ef3e222035fa10d21e
            ),
          ),
          SliverToBoxAdapter(
            child: BlocProvider(
              create: (_) =>
<<<<<<< HEAD
                  GetLectureCubit()..fetchLectures(region: 'Dyarb negm'),
              child: BlocListener<GetLectureCubit, GetLectureState>(
                listener: (context, state) {
                  if (state is DataLoaded) {
  showSnackBar(context, 'rebuild success');
}
                },
                child: const LectureCardListView(region: 'Dyarb negm'),
              ),
=======
                  GetLectureCubit()..streamLectures(region: 'Dyarb negm'),
              child: const LectureCardListView(region: 'Dyarb negm'),
>>>>>>> 9b8c90f2e2ac13f3bbb8f6ef3e222035fa10d21e
            ),
          ),
          SliverToBoxAdapter(
            child: BlocProvider(
              create: (_) =>
<<<<<<< HEAD
                  GetLectureCubit()..fetchLectures(region: 'Minya el Qamh'),
              child: BlocListener<GetLectureCubit, GetLectureState>(
                listener: (context, state) {
                  if (state is DataLoaded) {
  showSnackBar(context, 'rebuild success');
}
                },
                child: const LectureCardListView(region: 'Minya el Qamh'),
              ),
=======
                  GetLectureCubit()..streamLectures(region: 'Minya el Qamh'),
              child: const LectureCardListView(region: 'Minya el Qamh'),
>>>>>>> 9b8c90f2e2ac13f3bbb8f6ef3e222035fa10d21e
            ),
          ),
          SliverToBoxAdapter(
            child: BlocProvider(
              create: (_) =>
<<<<<<< HEAD
                  GetLectureCubit()..fetchLectures(region: 'Almogaze'),
              child: BlocListener<GetLectureCubit, GetLectureState>(
                listener: (context, state) {
                    if (state is DataLoaded) {
  showSnackBar(context, 'rebuild success');
}
                  },
                child: const LectureCardListView(region: 'Almogaze'),
              ),
=======
                  GetLectureCubit()..streamLectures(region: 'Almogaze'),
              child: const LectureCardListView(region: 'Almogaze'),
>>>>>>> 9b8c90f2e2ac13f3bbb8f6ef3e222035fa10d21e
            ),
          ),
          SliverToBoxAdapter(
            child: BlocProvider(
              create: (_) =>
<<<<<<< HEAD
                  GetLectureCubit()..fetchLectures(region: 'Shnbara'),
              child: BlocListener<GetLectureCubit,GetLectureState>(
                listener: (context, state) {
                    if (state is DataLoaded) {
  showSnackBar(context, 'rebuild success');
}
                  },
                child: const LectureCardListView(region: 'Shnbara')),
=======
                  GetLectureCubit()..streamLectures(region: 'Shnbara'),
              child: const LectureCardListView(region: 'Shnbara'),
>>>>>>> 9b8c90f2e2ac13f3bbb8f6ef3e222035fa10d21e
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:attendance/core/widgets/custom_lift_arrow.dart';
import 'package:attendance/feature/home/presentation/manger/add_lecture_cubit/add_lecture_cubit.dart';
import 'package:attendance/feature/home/presentation/view/widgets/add_lecture_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddLectureView extends StatelessWidget {
  const AddLectureView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {},
          icon: const CustomLiftArrow(
            colorIcon: Colors.white,
            backgroundColor: Colors.black,
          ),
        ),
        title: const Text('Add New Lecture'),
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (context) => AddLectureCubit(),
        child: const AddLectureViewBody(),
      ),
    );
  }
}

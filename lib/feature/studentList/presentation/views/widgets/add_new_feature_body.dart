import 'package:attendance/core/utils/firebase_services.dart';
import 'package:attendance/core/widgets/custom_container.dart';
import 'package:attendance/core/widgets/custom_snack_bar.dart';
import 'package:attendance/core/widgets/custom_text_filed.dart';
import 'package:attendance/feature/home/data/models/lecture_model.dart';
import 'package:attendance/feature/studentList/data/models/student_model.dart';
import 'package:attendance/feature/studentList/presentation/add_new_cubit/cubit/add_new_student_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddNewFeatureBody extends StatefulWidget {
  const AddNewFeatureBody({
    super.key, required this.lectureModel,
  });
  final LectureModel lectureModel;

  @override
  State<AddNewFeatureBody> createState() => _AddNewFeatureBodyState();
}

class _AddNewFeatureBodyState extends State<AddNewFeatureBody> {
  final GlobalKey<FormState> formKey = GlobalKey();

  String? code, name, studentId;

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  bool isLoading = false;

  final FirebaseServices firebaseServices = FirebaseServices();
  StudentModel? addNewStudentModel;

  @override
  Widget build(BuildContext context) {
    final codeController = TextEditingController();
    final nameController = TextEditingController();
    return BlocProvider(
      create: (context) => AddNewStudentCubit(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Form(
          autovalidateMode: autovalidateMode,
          key: formKey,
          child: ListView(children: [
            const SizedBox(
              height: 16,
            ),
            CustomTextField(
              controller: codeController,
              hintText: 'Student Code',
              onSaved: (value) {
                code = value;
              },
            ),
            const SizedBox(
              height: 12,
            ),
            CustomTextField(
              controller: nameController,
              hintText: 'Name',
              onSaved: (value) {
                name = value;
              },
            ),
            const SizedBox(
              height: 24,
            ),
            BlocBuilder<AddNewStudentCubit, AddNewStudentState>(
              builder: (context, state) {
                return CustomContainer(
                  text: 'add new student',
                  isLoading: state is AddNewStudentLoading ? true : false,
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();

                      BlocProvider.of<AddNewStudentCubit>(context)
                          .addStudentFeature(
                        lectureId: widget.lectureModel.id,
                        name: name!,
                        code: code!,
                      );
                      showSnackBar(context, 'Student was add success');
                      //! throw exption student id requered

                      // await firebaseServices.addStudentFeature(name!, code!,)
                      // isLoading = true;
                      // setState(() {});
                      // try {
                      //   isLoading = false;
                      //   setState(() {});
                      //   // ignore: use_build_context_synchronously
                      //   showSnackBar(context, 'Student was add successfully');
                      // } on FirebaseException {
                      //   showSnackBar(
                      //       // ignore: use_build_context_synchronously
                      //       context,
                      //       'Oops there was an error, try later');
                      // }
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  },
                );
              },
            ),
          ]),
        ),
      ),
    );
  }
}

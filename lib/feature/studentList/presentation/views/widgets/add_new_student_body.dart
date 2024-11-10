import 'package:attendance/core/widgets/custom_container.dart';
import 'package:attendance/feature/studentList/data/models/student_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:attendance/feature/studentList/presentation/add_new_cubit/cubit/add_new_student_cubit.dart';
import 'package:attendance/core/widgets/custom_text_filed.dart';
import 'package:attendance/core/widgets/custom_snack_bar.dart';

class AddNewStudentBody extends StatefulWidget {
  final String lectureId;

  const AddNewStudentBody({super.key, required this.lectureId});

  @override
  State<AddNewStudentBody> createState() => _AddNewStudentBodyState();
}

class _AddNewStudentBodyState extends State<AddNewStudentBody> {
  final GlobalKey<FormState> formKey = GlobalKey();
  String? code, name, phoneNumber, parentPhoneNumber;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: BlocProvider(
        create: (context) => AddNewStudentCubit(),
        child: Form(
          autovalidateMode: autovalidateMode,
          key: formKey,
          child: ListView(
            children: [
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                keyboardType: TextInputType.number,
                hintText: 'Student Code',
                onSaved: (value) => code = value,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                hintText: 'Name',
                onSaved: (value) => name = value,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                keyboardType: TextInputType.number,
                hintText: 'Phone Number',
                onSaved: (value) => phoneNumber = value,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                keyboardType: TextInputType.number,
                hintText: 'Parent Phone Number',
                onSaved: (value) => parentPhoneNumber = value,
              ),
              const SizedBox(
                height: 50,
              ),
              BlocBuilder<AddNewStudentCubit, AddNewStudentState>(
                builder: (context, state) {
                  return CustomContainer(
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();

                        final student = StudentModel(
                          code: code!,
                          name: name!,
                          phoneNumber: phoneNumber!,
                          parentPhoneNumber: parentPhoneNumber!,
                          studentId: widget.lectureId,
                        );

                        BlocProvider.of<AddNewStudentCubit>(context)
                            .addNewStudent(
                                widget.lectureId,
                                student.name,
                                student.code,
                                student.phoneNumber,
                                student.parentPhoneNumber);
                        showSnackBar(context, 'Student was added successfully');
                      } else {
                        autovalidateMode = AutovalidateMode.always;
                        setState(() {});
                      }
                    },
                    text: 'Add',
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

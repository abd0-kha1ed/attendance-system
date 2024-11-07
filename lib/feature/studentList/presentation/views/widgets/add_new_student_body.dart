import 'package:attendance/core/utils/firebase_services.dart';
import 'package:attendance/core/widgets/custom_container.dart';
import 'package:attendance/core/widgets/custom_snack_bar.dart';
import 'package:attendance/core/widgets/custom_text_filed.dart';
import 'package:attendance/feature/studentList/presentation/add_new_cubit/cubit/add_new_student_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class AddNewStudentBody extends StatefulWidget {
  const AddNewStudentBody({super.key});

  @override
  State<AddNewStudentBody> createState() => _AddNewStudentBodyState();
}

class _AddNewStudentBodyState extends State<AddNewStudentBody> {
  final GlobalKey<FormState> formKey = GlobalKey();
  String? code, name, phoneNumber, parentPhoneNumber;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  bool isLoading = false;

  final FirebaseServices firebaseServices = FirebaseServices();
  @override
  Widget build(BuildContext context) {
    final codeController = TextEditingController();
    final nameController = TextEditingController();
    final phoneNumberController = TextEditingController();
    final parentPhoneNumberController = TextEditingController();
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: BlocProvider(
          create: (context) => AddNewStudentCubit(),
          child: Form(
            autovalidateMode: autovalidateMode,
            key: formKey,
            child: ListView(
              children: [
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
                  height: 12,
                ),
                CustomTextField(
                  controller: phoneNumberController,
                  hintText: 'Phone Number',
                  onSaved: (value) {
                    phoneNumber = value;
                  },
                ),
                const SizedBox(
                  height: 12,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [Text('0/11')],
                ),
                const SizedBox(
                  height: 12,
                ),
                CustomTextField(
                  controller: parentPhoneNumberController,
                  hintText: 'Parent Phone Number',
                  onSaved: (value) {
                    parentPhoneNumber = value;
                  },
                ),
                const SizedBox(
                  height: 12,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [Text('0/11')],
                ),
                BlocBuilder<AddNewStudentCubit, AddNewStudentState>(
                  builder: (context, state) {
                    return CustomContainer(
                      isLoading: state is AddNewStudentLoading ? true : false,
                      text: 'Add',
                      onTap: () async {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          BlocProvider.of<AddNewStudentCubit>(context)
                              .addNewStudent(
                            name: name!,
                            phoneNumber: phoneNumber!,
                            parentPhoneNumber: parentPhoneNumber!,
                            code: code!,
                          );
                          // ignore: use_build_context_synchronously
                          showSnackBar(context, 'Student was add successfully');
                        } else {
                          autovalidateMode = AutovalidateMode.always;
                          setState(() {});
                        }
                      },
                    );
                  },
                ),
                const SizedBox(
                  height: 16,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

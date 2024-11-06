import 'package:attendance/core/utils/firebase_services.dart';
import 'package:attendance/core/widgets/custom_container.dart';
import 'package:attendance/core/widgets/custom_snack_bar.dart';
import 'package:attendance/core/widgets/custom_text_filed.dart';
import 'package:attendance/feature/teacher/presentation/manger/add_new_assistant_cubit/cubit/add_new_assistan_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddNewAssistantBody extends StatefulWidget {
  const AddNewAssistantBody({super.key});

  @override
  State<AddNewAssistantBody> createState() => _AddNewAssistantBodyState();
}

class _AddNewAssistantBodyState extends State<AddNewAssistantBody> {
  final GlobalKey<FormState> formKey = GlobalKey();
  final FirebaseServices firebaseServices = FirebaseServices();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? name, password, phone, email;

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final numberController = TextEditingController();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Form(
        autovalidateMode: autovalidateMode,
        key: formKey,
        child: ListView(
          children: [
            const SizedBox(
              height: 12,
            ),
            CustomTextField(
              labelText: 'Name',
              controller: nameController,
              onSaved: (value) {
                name = value;
              },
            ),
            const SizedBox(
              height: 8,
            ),
            CustomTextField(
              onSaved: (value) {
                phone = value;
              },
              labelText: 'Phone Number',
              controller: numberController,
            ),
            const SizedBox(
              height: 8,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [Text('0/11')],
            ),
            const SizedBox(
              height: 8,
            ),
            CustomTextField(
              onSaved: (value) {
                email = value;
              },
              labelText: 'Email',
              controller: emailController,
            ),
            const SizedBox(
              height: 8,
            ),
            CustomTextField(
              onSaved: (value) {
                password = value;
              },
              labelText: 'PassWord',
              controller: passwordController,
            ),
            const SizedBox(
              height: 16,
            ),
            BlocBuilder<AddNewAssistantCubit, AddNewAssistantState>(
              builder: (context, state) {
                return CustomContainer(
                    isLoading: state is AddNewAssistantLoading ? true : false,
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        BlocProvider.of<AddNewAssistantCubit>(context)
                            .addNewAssistant(
                                name: name!,
                                phoneNumber: phone!,
                                email: email!,
                                password: password!);
                        // GoRouter.of(context).pop();
                        showSnackBar(context, 'Assistant was add success');
                      } else {
                        autovalidateMode = AutovalidateMode.always;
                        setState(() {});
                      }

                      // final name = nameController.text;
                      // final phoneNumber = numberController.text;
                      // final email = emailController.text;
                      // final password = passwordController.text;

                      // try {
                      //   await firebaseServices.addNewAssistant(
                      //       name!, phone!, email!, password!);
                      // } on FirebaseException catch (e) {
                      //   print('Error adding assistant: ${e.message}');
                      // }
                    },
                    text: 'Add');
              },
            )
          ],
        ),
      ),
    );
  }
}

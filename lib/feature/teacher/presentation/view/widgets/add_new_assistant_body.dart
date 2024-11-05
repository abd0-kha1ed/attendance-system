import 'package:attendance/core/utils/firebase_services.dart';
import 'package:attendance/core/widgets/custom_container.dart';
import 'package:attendance/core/widgets/custom_snack_bar.dart';
import 'package:attendance/core/widgets/custom_text_filed.dart';
import 'package:attendance/feature/teacher/presentation/manger/add_new_assistant_cubit/cubit/add_new_assistan_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AddNewAssistantBody extends StatefulWidget {
  const AddNewAssistantBody({super.key});

  @override
  State<AddNewAssistantBody> createState() => _AddNewAssistantBodyState();
}

class _AddNewAssistantBodyState extends State<AddNewAssistantBody> {
  final GlobalKey<FormState> formkey = GlobalKey();
  final FirebaseServices firebaseServices = FirebaseServices();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? name, password, phone, email;

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final numberController = TextEditingController();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return BlocProvider(
      create: (context) => AddNewAssistanCubit(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Form(
          autovalidateMode: autovalidateMode,
          key: formkey,
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
                labelText: 'Phoen Number',
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
              BlocBuilder<AddNewAssistanCubit, AddNewAssistanState>(
                builder: (context, state) {
                  return CustomContainer(
                      isloading: state is AddNewAssistantLoading ? true : false,
                      onTap: () async {
                        if (formkey.currentState!.validate()) {
                          formkey.currentState!.save();
                        } else {
                          autovalidateMode = AutovalidateMode.always;
                          setState(() {});
                        }

                        BlocProvider.of<AddNewAssistanCubit>(context)
                            .addnewassistnat(
                                name: name!,
                                phoneNumber: phone!,
                                email: email!,
                                password: password!);
                        // GoRouter.of(context).pop();
                        showSnackBar(context, 'Assistant was add');

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
      ),
    );
  }
}

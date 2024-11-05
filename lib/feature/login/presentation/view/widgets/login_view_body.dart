import 'package:attendance/constant.dart';
import 'package:attendance/core/utils/app_routers.dart';
import 'package:attendance/core/widgets/custom_container.dart';
import 'package:attendance/core/widgets/custom_snack_bar.dart';
import 'package:attendance/core/widgets/custom_text_filed.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  final List<bool> isSelected = [true, false];
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _isObscured = true;
  bool isLoading = false;
  // Initial selection for "Assistant"
  final GlobalKey<FormState> formkey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: formkey,
          autovalidateMode: autovalidateMode,
          child: ListView(
            children: [
              const SizedBox(
                height: 60,
              ),
              const Icon(
                Icons.school,
                size: 120,
                color: kLogoColor,
              ),
              const SizedBox(
                height: 20,
              ),
              const Center(
                child: Text(
                  'Attendance System',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
                ),
              ),
<<<<<<< HEAD
              const SizedBox(
                height: 25,
              ),
              Center(
                child: ToggleButtons(
                  color: kLogoColor,
                  borderColor: Colors.blue,
                  selectedBorderColor: Colors.blue,
                  selectedColor: Colors.white,
                  fillColor: Colors.blue,
                  borderRadius: BorderRadius.circular(28),
                  isSelected: isSelected,
                  onPressed: (int index) {
                    setState(() {
                      for (int i = 0; i < isSelected.length; i++) {
                        isSelected[i] = i == index; // Update selection state
                      }
                    });
                  },
                  children: const [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5.0),
                            child: Icon(
                              Icons.help_center,
                            ),
                          ), // Assistant icon
                          Text('Assistant'),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5),
                            child: Icon(Icons.school),
                          ), // Teacher icon
                          Text('Teacher'),
                        ],
                      ),
                    ),
                  ],
=======
              const SizedBox(height: 25),
              _buildRoleToggleButtons(),
              const SizedBox(height: 25),
              CustomTextField(
                controller: emailController,
                labelText: 'Email',
              ),
              const SizedBox(height: 12),
              CustomTextField(
                controller: passwordController,
                obscureText: _isObscured,
                labelText: 'Password',
                iconButton: IconButton(
                  icon: Icon(_isObscured ? Icons.visibility_off : Icons.visibility),
                  onPressed: () => setState(() => _isObscured = !_isObscured),
>>>>>>> def0ad8c8a635f5a5f60bc14161ad7a0b19fd4be
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              CustomTextField(
                onChanged: (value) {
                  email = value;
                },
                labelText: 'Email',
              ),
              const SizedBox(
                height: 12,
              ),
              CustomTextField(
                obscureText: _isObscured,
                onChanged: (value) {
                  passWord = value;
                },
                labelText: 'PassWord',
                iconButton: IconButton(
                  icon: Icon(
                    _isObscured ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: () {
                    setState(() {
                      _isObscured = !_isObscured; // Toggle password visibility
                    });
                  },
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              CustomContainer(
                onTap: () async {
                  if (formkey.currentState!.validate()) {
                    // formkey.currentState!.save();
                    isLoading = true;

                    setState(() {});
                    try {
                      final credential = await FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                              email: email!, password: passWord!);
                      GoRouter.of(context).push(AppRouters.kHomeView);
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'user-not-found') {
                        print('No user found for that email.');
                      } else if (e.code == 'wrong-password') {
                        // print('Wrong password provided for that user.');
                        showSnackBar(context, e.toString());
                      }
                    } catch (ex) {
                      print(ex);
                      showSnackBar(context, 'there was an error');
                    }
                    isLoading = false;
                    setState(() {});
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
                text: 'Login',
              )
            ],
          ),
        ),
      ),
    );
  }
<<<<<<< HEAD
=======

  Widget _buildRoleToggleButtons() {
    return Center(
      child: ToggleButtons(
        color: kLogoColor,
        borderColor: Colors.blue,
        selectedBorderColor: Colors.blue,
        selectedColor: Colors.white,
        fillColor: Colors.blue,
        borderRadius: BorderRadius.circular(28),
        isSelected: isSelected,
        onPressed: (int index) {
          setState(() {
            for (int i = 0; i < isSelected.length; i++) {
              isSelected[i] = i == index;
            }
          });
        },
        children: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.help_center, size: 20),
                SizedBox(width: 5),
                Text('Assistant'),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.school, size: 20),
                SizedBox(width: 5),
                Text('Teacher'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _login() async {
    if (formkey.currentState!.validate()) {
      setState(() => isLoading = true);
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );

        // Clear fields after successful login
        emailController.clear();
        passwordController.clear();

        // Navigate to Home
        GoRouter.of(context).push(AppRouters.kHomeView);
      } on FirebaseAuthException catch (e) {
        String errorMessage;
        if (e.code == 'user-not-found') {
          errorMessage = 'No user found with this email.';
        } else if (e.code == 'wrong-password') {
          errorMessage = 'Incorrect password. Please try again.';
        } else {
          errorMessage = 'An unexpected error occurred.';
        }
        showSnackBar(context, errorMessage);
      } catch (_) {
        showSnackBar(context, 'An error occurred. Please try again.');
      } finally {
        setState(() => isLoading = false);
      }
    } else {
      setState(() => autovalidateMode = AutovalidateMode.always);
    }
  }
>>>>>>> def0ad8c8a635f5a5f60bc14161ad7a0b19fd4be
}
//l;k
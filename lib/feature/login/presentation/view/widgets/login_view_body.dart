import 'package:attendance/constant.dart';
import 'package:attendance/core/utils/app_routers.dart';
import 'package:attendance/core/widgets/custom_container.dart';
import 'package:attendance/core/widgets/custom_snack_bar.dart';
import 'package:attendance/core/widgets/custom_text_filed.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  final List<bool> isSelected = [false, true]; // Default to Teacher (index 1)
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _isObscured = true;
  bool isLoading = false;
  final GlobalKey<FormState> formkey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String role = 'Teacher'; // Default role is Teacher

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
              const SizedBox(height: 60),
              const Icon(Icons.school, size: 120, color: kLogoColor),
              const SizedBox(height: 20),
              const Center(
                child: Text(
                  'Attendance System',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
                ),
              ),
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
                  icon: Icon(
                      _isObscured ? Icons.visibility_off : Icons.visibility),
                  onPressed: () => setState(() => _isObscured = !_isObscured),
                ),
              ),
              const SizedBox(height: 16),
              CustomContainer(
                onTap: _login,
                text: 'Login',
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ToggleButtons to switch between Teacher and Assistant
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
            // Update the role based on the selected button
            role = index == 0 ? "Assistant" : "Teacher";
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

  // Login method
  Future<void> _login() async {
    if (formkey.currentState!.validate()) {
      setState(() => isLoading = true);
      try {
        // Sign in using Firebase Authentication
        // Debugging line
        if (role == 'Teacher') {
          // ignore: unused_local_variable
          UserCredential userCredential =
              await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: emailController.text,
            password: passwordController.text,
          );
          // If the user is a Teacher, navigate to the Teacher's page
          // ignore: use_build_context_synchronously
          GoRouter.of(context).push(AppRouters.kHomeView);
        } else if (role == 'Assistant') {
          // If the user is an Assistant, check in Firestore
          QuerySnapshot assistantsQuery = await FirebaseFirestore.instance
              .collection('assistants') // Firestore collection for assistants
              .where('email', isEqualTo: emailController.text)
              .get();
          // Debugging line
          if (assistantsQuery.docs.isEmpty) {
            // No matching assistant found
            // Debugging line
            // ignore: use_build_context_synchronously
            showSnackBar(context, 'No assistant found with this email.');
          } else {
            // Assistant found, navigate to the Assistant's page
            // ignore: use_build_context_synchronously
            // ignore: use_build_context_synchronously
            GoRouter.of(context).push(AppRouters.kAssistantHomeView);
          }
        }

        // Clear fields after success
        emailController.clear();
        passwordController.clear();
      } on FirebaseAuthException catch (e) {
        String errorMessage = _getErrorMessage(e);
        // ignore: use_build_context_synchronously
        showSnackBar(context, errorMessage);
      } catch (_) {
        // ignore: use_build_context_synchronously
        showSnackBar(context, 'An unexpected error occurred.');
      } finally {
        setState(() => isLoading = false);
      }
    } else {
      setState(() => autovalidateMode = AutovalidateMode.always);
    }
  }

  // Get the error message from Firebase Auth exception
  String _getErrorMessage(FirebaseAuthException e) {
    if (e.code == 'user-not-found') {
      return 'No user found with this email.';
    } else if (e.code == 'wrong-password') {
      return 'Incorrect password. Please try again.';
    } else {
      return 'Wrong passWord or you don not have an account in ourservice.';
    }
  }
}

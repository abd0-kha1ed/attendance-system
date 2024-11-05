import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomAlertDialogWidget extends StatelessWidget {
  const CustomAlertDialogWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      icon: const Icon(
        Icons.warning,
        color: Colors.yellow,
        size: 30,
      ),
      title: const Text('Account Logout'),
      content: const SizedBox(
        height: 90,
        child: Column(
          children: [
            Text(
              'you are going to log out of your ',
              style: TextStyle(fontSize: 17),
            ),
            Text(
              'account',
              style: TextStyle(fontSize: 17),
            ),
            Text(
              'are you sure?',
              style: TextStyle(fontSize: 17),
            )
          ],
        ),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextButton(
              onPressed: () async {
                try {
                  await FirebaseAuth.instance.signOut();

                  // ignore: use_build_context_synchronously
                  GoRouter.of(context).pop();
                  // ignore: use_build_context_synchronously
                  GoRouter.of(context).pop();
                } on Exception catch (e) {
                  throw Exception(e.toString());
                } // Dismiss the dialog
              },
              child: const Text(
                'yes',
                style: TextStyle(fontSize: 22, color: Colors.red),
              ),
            ),
            TextButton(
              onPressed: () {
                GoRouter.of(context).pop();
              },
              child: const Text(
                'No',
                style: TextStyle(fontSize: 22, color: Colors.black),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

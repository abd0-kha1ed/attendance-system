
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CusotmAlerDialogWidget extends StatelessWidget {
  const CusotmAlerDialogWidget({
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
              onPressed: () {
                Navigator.of(context).pop(); // Dismiss the dialog
              },
              child: const Text(
                'yes',
                style: TextStyle(fontSize: 22, color: Colors.red),
              ),
            ),
            TextButton(
              onPressed: () {
                
                // await FirebaseAuth.instance.signOut();
                Navigator.of(context).pop();
                // Dismiss the dialog
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

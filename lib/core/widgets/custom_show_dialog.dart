import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomShowDialog extends StatelessWidget {
  const CustomShowDialog({super.key, this.onPressed});
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      icon: const Icon(
        Icons.warning,
        color: Colors.yellow,
        size: 30,
      ),
      title: const Text('Delete'),
      content: const SizedBox(
        height: 90,
        child: Column(
          children: [
            Text(
              'you are going to delete ',
              style: TextStyle(fontSize: 17),
            ),
            Text(
              'this item',
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
              onPressed: onPressed,
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

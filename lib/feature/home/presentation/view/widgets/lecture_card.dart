
import 'package:flutter/material.dart';

class LectureCard extends StatelessWidget {
  const LectureCard({super.key});
  @override
  Widget build(BuildContext context) {
    return const Card(
      child: SizedBox(
        width: 130,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('104 Students'),
            Text('3rd Secondary'),
            Text('Sunday - 1:00 PM'),
          ],
        ),
      ),
    );
  }
}
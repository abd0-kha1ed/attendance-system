import 'package:attendance/constant.dart';
import 'package:flutter/material.dart';

class CustomStudentNameId extends StatelessWidget {
  const CustomStudentNameId(
      {super.key, required this.name, required this.code});
  final String name, code;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          color: kAppBarColor,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                code,
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        Text(
          name,
          // style: TextStyle(fontSize: 20),
        ),
      ],
    );
  }
}

import 'package:attendance/constant.dart';
import 'package:flutter/material.dart';

class CustomStudintNameId extends StatelessWidget {
  const CustomStudintNameId({super.key});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 60,
          width: 60,
          color: kAppBarColor,
          child: const Center(
            child: Text(
              '115',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        const SizedBox(width: 150, child: Text(' احمد مختار خطاب')),
      ],
    );
  }
}

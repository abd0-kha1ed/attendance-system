import 'package:attendance/core/widgets/custom_text_filed.dart';
import 'package:flutter/material.dart';

class CustomSearchStudentList extends StatelessWidget {
  const CustomSearchStudentList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      labelText: 'Name',
      iconButton: IconButton(onPressed: () {}, icon: const Icon(Icons.clear)),
    );
  }
}

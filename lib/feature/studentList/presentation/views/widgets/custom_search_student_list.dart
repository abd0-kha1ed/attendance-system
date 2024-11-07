import 'package:flutter/material.dart';

class CustomSearchStudentList extends StatelessWidget {
  final TextEditingController controller;
  // final ValueChanged<String> onChanged;

  const CustomSearchStudentList({
    super.key,
    required this.controller,
    // required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      // onChanged: onChanged,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
        labelText: 'Search by Name',
        suffixIcon: IconButton(
          onPressed: () {
            controller.clear();
            // onChanged(''); // Clear the search field and reset the filter
          },
          icon: const Icon(Icons.clear),
        ),
      ),
    );
  }
}

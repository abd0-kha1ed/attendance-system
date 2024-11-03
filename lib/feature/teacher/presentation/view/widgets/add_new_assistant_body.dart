import 'package:attendance/core/widgets/custom_container.dart';
import 'package:attendance/core/widgets/custom_text_filed.dart';
import 'package:flutter/material.dart';

class AddNewAssistantBody extends StatelessWidget {
  const AddNewAssistantBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: ListView(
        children: const [
          SizedBox(
            height: 12,
          ),
          CustomTextField(labelText: 'Name'),
          SizedBox(
            height: 8,
          ),
          CustomTextField(labelText: 'Phoen Number'),
          SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [Text('0/11')],
          ),
          SizedBox(
            height: 8,
          ),
          CustomTextField(labelText: 'Email'),
          SizedBox(
            height: 8,
          ),
          CustomTextField(labelText: 'PassWord'),
          SizedBox(
            height: 16,
          ),
          CustomContainer(text: 'Add')
        ],
      ),
    );
  }
}

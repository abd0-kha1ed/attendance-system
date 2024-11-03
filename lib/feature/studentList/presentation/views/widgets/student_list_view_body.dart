import 'package:attendance/constant.dart';
import 'package:attendance/core/widgets/custom_icon_button.dart';
import 'package:attendance/feature/studentList/presentation/views/widgets/custom_student_name_id.dart';
import 'package:attendance/core/widgets/custom_text_filed.dart';
import 'package:attendance/core/widgets/whats_phone.dart';
import 'package:flutter/material.dart';

class StudentListViewBody extends StatelessWidget {
  const StudentListViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          CustomTextField(
            labelText: 'Name',
            iconButton:
                IconButton(onPressed: () {}, icon: const Icon(Icons.clear)),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView.builder(
                itemCount: 15,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(child: CustomStudintNameId()),
                          const SizedBox(
                            height: 30,
                          ),
                          CustomIconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.edit,
                              color: kAppBarColor,
                            ),
                          ),
                        ],
                      ),
                      const WhatsPhone(),
                      const SizedBox(
                        height: 10,
                      ),
                      const Divider(),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  );
                }),
          )
        ],
      ),
    );
  }
}

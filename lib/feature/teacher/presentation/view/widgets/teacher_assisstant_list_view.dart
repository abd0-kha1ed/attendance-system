import 'package:attendance/core/widgets/whats_phone.dart';
import 'package:attendance/feature/teacher/presentation/view/widgets/item_teacher_assistant_listview.dart';
import 'package:flutter/material.dart';

class TeacherAssistantListView extends StatelessWidget {
  const TeacherAssistantListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: 8,
        itemBuilder: (context, index) {
          return const Column(
            children: [
              SizedBox(
                height: 30,
              ),
              ItemTeacherAssistantListView(),
              WhatsPhone(),
              Divider(
                indent: 40,
                endIndent: 40,
              )
            ],
          );
        });
  }
}

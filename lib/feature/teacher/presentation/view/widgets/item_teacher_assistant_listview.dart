import 'package:attendance/core/widgets/custom_icon_button.dart';
import 'package:attendance/feature/teacher/data/models/add_assistant_model.dart';
import 'package:flutter/material.dart';

class ItemTeacherAssistantListView extends StatelessWidget {
  const ItemTeacherAssistantListView({
    super.key,
    required this.assistantModel,
  });
  final AddAssistantModel assistantModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Icon(
          Icons.person,
          size: 50,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(assistantModel.name),
            SizedBox(
              // width: 230,
              child: Text(
                assistantModel.email,
                maxLines: 2,
              ),
            ),
            Text(assistantModel.phoneNumber),
          ],
        ),
        CustomIconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.delete_forever,
            size: 40,
            color: Colors.red,
          ),
        )
      ],
    );
  }
}

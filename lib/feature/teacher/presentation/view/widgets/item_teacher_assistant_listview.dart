import 'package:attendance/core/utils/firebase_services.dart';
import 'package:attendance/core/widgets/custom_icon_button.dart';
import 'package:attendance/core/widgets/custom_show_dialog.dart';
import 'package:attendance/feature/teacher/data/models/add_assistant_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ItemTeacherAssistantListView extends StatelessWidget {
  ItemTeacherAssistantListView({
    super.key,
    required this.assistantModel,
  });
  final AddAssistantModel assistantModel;
  final FirebaseServices firebaseServices = FirebaseServices();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Icon(
          Icons.person,
          size: 50,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(assistantModel.name),
            Text(
              assistantModel.email,
              maxLines: 2,
            ),
            Text(assistantModel.phoneNumber),
          ],
        ),
        CustomIconButton(
          onPressed: () async {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return CustomShowDialog(
                    onPressed: () async {
                      await firebaseServices
                          .deleteAssistant(assistantModel.assistantId);
                      // ignore: use_build_context_synchronously
                      GoRouter.of(context).pop();
                    },
                  );
                });

            //await firebaseServices.deleteAssistant(assistantModel.assistantId);
          },
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

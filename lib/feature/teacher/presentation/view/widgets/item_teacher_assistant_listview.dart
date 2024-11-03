import 'package:attendance/core/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';

class ItemTeacherAssistantListView extends StatelessWidget {
  const ItemTeacherAssistantListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Icon(
          Icons.person,
          size: 50,
        ),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name'),
            SizedBox(
              // width: 230,
              child: Text(
                'mahmoudahmedhsn@gmail.com',
                maxLines: 2,
              ),
            ),
            Text('01125144905'),
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

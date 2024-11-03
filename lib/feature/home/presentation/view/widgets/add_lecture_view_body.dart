import 'package:attendance/constant.dart';
import 'package:attendance/core/widgets/custom_drop_down.dart';
import 'package:flutter/material.dart';

class AddLectureViewBody extends StatefulWidget {
  const AddLectureViewBody({Key? key}) : super(key: key);

  @override
  State<AddLectureViewBody> createState() => _AddLectureViewBodyState();
}

class _AddLectureViewBodyState extends State<AddLectureViewBody> {
  List<bool> isSelected = [true, false];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Text('Region'),
            SizedBox(width: 16),
            ToggleButtons(
              color: kappbarcolor,
              borderColor: kappbarcolor,
              selectedBorderColor: kappbarcolor,
              selectedColor: Colors.white,
              fillColor: kappbarcolor,
              borderRadius: BorderRadius.circular(28),
              isSelected: isSelected,
              onPressed: (int index) {
                setState(() {
                  for (int i = 0; i < isSelected.length; i++) {
                    isSelected[i] = i == index; // Update selection state
                  }
                });
              },
              children: const [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Assistant icon
                      Text('saturday'),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Teacher icon
                      Text('monday'),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          height: 40,
        ),
        Text('grade'),
        Expanded(child: DropdownExampleApp())
      ],
    );
  }
}

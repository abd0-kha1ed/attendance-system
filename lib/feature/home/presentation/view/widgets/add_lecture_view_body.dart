import 'package:attendance/constant.dart';

import 'package:flutter/material.dart';

class AddLectureViewBody extends StatefulWidget {
  const AddLectureViewBody({super.key});

  @override
  State<AddLectureViewBody> createState() => _AddLectureViewBodyState();
}

class _AddLectureViewBodyState extends State<AddLectureViewBody> {
  List<bool> isSelected = [true, false];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            const Text('Region'),
            const SizedBox(width: 16),
            ToggleButtons(
              color: kAppBarColor,
              borderColor: kAppBarColor,
              selectedBorderColor: kAppBarColor,
              selectedColor: Colors.white,
              fillColor: kAppBarColor,
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
        const SizedBox(
          height: 40,
        ),
        const Text('grade'),
        // CustomDropDown()
      ],
    );
  }
}

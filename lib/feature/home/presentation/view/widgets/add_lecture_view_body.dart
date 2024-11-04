import 'package:attendance/constant.dart';
import 'package:attendance/core/widgets/custom_container.dart';
import 'package:attendance/feature/home/presentation/view/widgets/custom_dropdown_button.dart';

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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Starting Day'),
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
            height: 15,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('grade'),
              CustomDropdownButton(
                items: [
                  '1st Prep',
                  '2nd Prep',
                  '3rd Prep',
                  '1st Secondary',
                  '2nd Secondary',
                  '3rd Secondary'
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Region'),
              CustomDropdownButton(items: [
                'Abo hamad',
                'Zagazig',
                '10th of ramadan',
                'Dyarb negm',
                'Minya el qamh',
                'Almogaze',
                'Shnbara',
              ]),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Total count of Students'),
              GestureDetector(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: kAppBarColor,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(
                          '10',
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Lecture Time'),
              GestureDetector(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: kAppBarColor,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      '1:27 PM',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          CustomContainer(
            text: 'Add Lecture',
            onTap: () {},
          )
        ],
      ),
    );
  }
}

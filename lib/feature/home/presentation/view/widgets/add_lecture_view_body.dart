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
  int selectedCount = 1;
  void showPickerBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Container(
          height: 300,
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Column(
            children: [
              Expanded(
                child: ListWheelScrollView.useDelegate(
                  magnification: 1.5,
                  itemExtent: 50,
                  physics: const FixedExtentScrollPhysics(),
                  overAndUnderCenterOpacity: 0.3,
                  perspective: 0.003,
                  onSelectedItemChanged: (index) {
                    setState(() {
                      selectedCount = index + 1;
                    });
                  },
                  childDelegate: ListWheelChildBuilderDelegate(
                    builder: (context, index) => Center(
                      child: Container(
                        color: Colors.transparent,
                        alignment: Alignment.center,
                        height: 50,
                        child: Text(
                          '${index + 1}',
                          style: const TextStyle(
                            fontSize: 24,
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                    childCount: 100000,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

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
                onTap: () {
                  showPickerBottomSheet(context);
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: kAppBarColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(
                          '$selectedCount',
                          style: const TextStyle(color: Colors.white),
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        const Icon(
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

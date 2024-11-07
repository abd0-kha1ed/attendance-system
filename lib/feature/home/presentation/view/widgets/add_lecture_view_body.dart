import 'package:attendance/constant.dart';
import 'package:attendance/core/widgets/custom_container.dart';
import 'package:attendance/core/widgets/custom_snack_bar.dart';
import 'package:attendance/feature/home/presentation/manger/add_lecture_cubit/add_lecture_cubit.dart';
import 'package:attendance/feature/home/presentation/manger/add_lecture_cubit/add_lecture_cubit_state.dart';
import 'package:attendance/feature/home/presentation/view/widgets/custom_dropdown_button.dart';
import 'package:attendance/feature/home/presentation/view/widgets/time_picker_bottom_sheet.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddLectureViewBody extends StatefulWidget {
  const AddLectureViewBody({super.key});

  @override
  State<AddLectureViewBody> createState() => _AddLectureViewBodyState();
}

class _AddLectureViewBodyState extends State<AddLectureViewBody> {
  DateTime selectedTime = DateTime.now();

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
    return BlocBuilder<AddLectureCubit, AddLectureState>(
        builder: (context, state) {
      final cubit = context.read<AddLectureCubit>();

      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Starting Day'),
                ToggleButtons(
                  color: kAppBarColor,
                  borderColor: kAppBarColor,
                  selectedBorderColor: kAppBarColor,
                  selectedColor: Colors.white,
                  fillColor: kAppBarColor,
                  borderRadius: BorderRadius.circular(28),
                  isSelected: List.generate(
                      2, (index) => index == state.selectedDayIndex),
                  onPressed: (index) {
                    cubit.updateSelectedDayIndex(index);
                  },
                  children: const [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      child: Text('saturday'),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      child: Text('monday'),
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
                  onTap: () async {
                    final result = await showModalBottomSheet<DateTime>(
                      context: context,
                      isScrollControlled: true,
                      builder: (BuildContext context) {
                        return const TimePickerBottomSheet();
                      },
                    );
                    if (result != null) {
                      setState(() {
                        selectedTime = result;
                      });
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: kAppBarColor,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '${selectedTime.hour}:${selectedTime.minute.toString().padLeft(2, '0')} ${selectedTime.hour >= 12 ? 'PM' : 'AM'}',
                        style: const TextStyle(color: Colors.white),
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
              onTap: () async {
                await context.read<AddLectureCubit>().addLectureData();
                showSnackBar(context, 'Lecture saved successfully');
              },
            )
          ],
        ),
      );
    });
  }
}

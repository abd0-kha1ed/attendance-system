import 'package:attendance/constant.dart';
import 'package:attendance/core/utils/firebase_services.dart';
import 'package:attendance/core/widgets/custom_container.dart';
import 'package:attendance/core/widgets/custom_snack_bar.dart';
import 'package:attendance/feature/home/data/models/lecture_model.dart';
import 'package:attendance/feature/home/presentation/manger/add_lecture_cubit/add_lecture_cubit.dart';
import 'package:attendance/feature/home/presentation/manger/add_lecture_cubit/add_lecture_cubit_state.dart';
import 'package:attendance/feature/home/presentation/view/widgets/custom_dropdown_button.dart';
import 'package:attendance/feature/home/presentation/view/widgets/time_picker_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class EditLectureViewBody extends StatefulWidget {
  const EditLectureViewBody({super.key, required this.lectureModel});

  final LectureModel lectureModel;

  @override
  State<EditLectureViewBody> createState() => _EditLectureViewBodyState();
}

class _EditLectureViewBodyState extends State<EditLectureViewBody> {
  late DateTime selectedTime;
  late List<bool> isSelected;
  late int selectedCount;

  @override
  void initState() {
    super.initState();

    // تعبئة القيم الأولية بناءً على بيانات lectureModel
    selectedTime = widget.lectureModel.time ?? DateTime.now();
    selectedCount = widget.lectureModel.studentCount;

    // إعداد زر Toggle بناءً على اليوم المختار
    isSelected = [
      widget.lectureModel.startingDay.toLowerCase() == 'saturday',
      widget.lectureModel.startingDay.toLowerCase() == 'sunday',
    ];
  }

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
              const SizedBox(height: 20),
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
                    isSelected: isSelected,
                    onPressed: (int index) {
                      setState(() {
                        for (int i = 0; i < isSelected.length; i++) {
                          isSelected[i] = i == index;
                        }
                      });
                    },
                    children: const [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.0),
                        child: Text('Saturday'),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.0),
                        child: Text('Sunday'),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Grade'),
                  CustomDropdownButton(
                    value: widget.lectureModel.grade,
                    items: const [
                      '1st Prep',
                      '2nd Prep',
                      '3rd Prep',
                      '1st Secondary',
                      '2nd Secondary',
                      '3rd Secondary'
                    ],
                    onChanged: (value) {
                      // تحديث قيمة grade هنا إذا لزم الأمر
                    },
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Region'),
                  CustomDropdownButton(
                    value: widget.lectureModel.region,
                    items: const [
                      'Abo hamad',
                      'Zagazig',
                      '10th of ramadan',
                      'Dyarb negm',
                      'Minya el qamh',
                      'Almogaze',
                      'Shnbara'
                    ],
                    onChanged: (value) {
                      // تحديث قيمة region هنا إذا لزم الأمر
                    },
                  ),
                ],
              ),
              const SizedBox(height: 12),
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
                            const SizedBox(width: 6),
                            const Icon(Icons.person, color: Colors.white),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
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
              const SizedBox(height: 30),
              CustomContainer(
                text: 'Update Lecture',
                onTap: () async {
                  try {
                    await FirebaseServices().updateLectureData(
                        widget.lectureModel.id,
                        state.region,
                        state.selectedCount,
                        state.selectedTime,
                        state.grade,
                        state.selectedDayIndex);
                    GoRouter.of(context).pop();
                    showSnackBar(context, 'Lecture saved successfully');
                  } on Exception catch (e) {
                    showSnackBar(context, 'opps there was an error');
                  }
                },
              )
            ],
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';

class TimePickerBottomSheet extends StatefulWidget {
  const TimePickerBottomSheet({super.key});

  @override
  State<TimePickerBottomSheet> createState() => _TimePickerBottomSheetState();
}

class _TimePickerBottomSheetState extends State<TimePickerBottomSheet> {
  int selectedHour = 1;
  int selectedMinute = 0;
  String period = 'AM';
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300, // Fixed height for bottom sheet
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const SizedBox(
            height: 20,
          ),
          // Hours Scroll
          Expanded(
            child: ListWheelScrollView.useDelegate(
              magnification: 1.5,
              perspective: 0.003,
              overAndUnderCenterOpacity: 0.3,
              itemExtent: 50,
              onSelectedItemChanged: (index) {
                setState(() {
                  selectedHour = index + 1;
                });
              },
              childDelegate: ListWheelChildBuilderDelegate(
                builder: (context, index) {
                  return Center(
                      child: Container(
                    color: Colors.transparent,
                    alignment: Alignment.center,
                    child: Text('${index % 12 + 1}',
                        style: const TextStyle(fontSize: 24)),
                  ));
                },
              ),
            ),
          ),
          // Minutes Scroll
          Expanded(
            child: ListWheelScrollView.useDelegate(
              magnification: 1.5,
              perspective: 0.003,
              overAndUnderCenterOpacity: 0.3,
              itemExtent: 50,
              onSelectedItemChanged: (index) {
                setState(() {
                  selectedMinute = index + 1;
                });
              },
              childDelegate: ListWheelChildBuilderDelegate(
                builder: (context, index) {
                  return Center(
                      child: Container(
                    color: Colors.transparent,
                    alignment: Alignment.center,
                    child: Text('${index % 60}',
                        style: const TextStyle(fontSize: 24)),
                  ));
                },
              ),
            ),
          ),
          // AM/PM Scroll
          Expanded(
            child: ListWheelScrollView(
              magnification: 1.5,
              perspective: 0.003,
              overAndUnderCenterOpacity: 0.3,
              itemExtent: 50,
              children: const [
                Center(child: Text('AM', style: TextStyle(fontSize: 24))),
                Center(child: Text('PM', style: TextStyle(fontSize: 24))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:attendance/constant.dart';
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
      height: 300,
      child: Column(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
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
                          child: Text('${index % 12 + 1}',
                              style: const TextStyle(fontSize: 24)),
                        );
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: ListWheelScrollView.useDelegate(
                    magnification: 1.5,
                    perspective: 0.003,
                    overAndUnderCenterOpacity: 0.3,
                    itemExtent: 50,
                    onSelectedItemChanged: (index) {
                      setState(() {
                        selectedMinute = index;
                      });
                    },
                    childDelegate: ListWheelChildBuilderDelegate(
                      builder: (context, index) {
                        return Center(
                          child: Text('${index % 60}',
                              style: const TextStyle(fontSize: 24)),
                        );
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: ListWheelScrollView(
                    magnification: 1.5,
                    perspective: 0.003,
                    overAndUnderCenterOpacity: 0.3,
                    itemExtent: 50,
                    onSelectedItemChanged: (index) {
                      setState(() {
                        period = index == 0 ? 'AM' : 'PM';
                      });
                    },
                    children: const [
                      Center(child: Text('AM', style: TextStyle(fontSize: 24))),
                      Center(child: Text('PM', style: TextStyle(fontSize: 24))),
                    ],
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton(
            style: const ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(kAppBarColor),
            ),
            onPressed: () {
              final selectedDateTime = DateTime(
                DateTime.now().year,
                DateTime.now().month,
                DateTime.now().day,
                period == 'AM' ? selectedHour : selectedHour + 12,
                selectedMinute,
              );
              Navigator.pop(context, selectedDateTime);
            },
            child: const Text(
              'Confirm',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

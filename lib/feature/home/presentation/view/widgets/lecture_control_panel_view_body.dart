import 'package:attendance/feature/home/data/models/lecture_model.dart';
import 'package:attendance/feature/home/presentation/view/widgets/control_panel_section.dart';
import 'package:flutter/material.dart';

class LectureControlPanelViewBody extends StatelessWidget {
  const LectureControlPanelViewBody({super.key, required this.lectureModel});
  final LectureModel lectureModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Region'),
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xff042B59),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
                  child: Text(
                    lectureModel.region,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Day & Time'),
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xff042B59),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
                  child: Text(
                    '${lectureModel.startingDay} - ${lectureModel.time!.hour}:${lectureModel.time!.minute} ${lectureModel.time!.hour >= 12 ? 'PM' : 'AM'}',
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Grade'),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xff042B59),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 6, vertical: 6),
                      child: Text(
                        lectureModel.grade,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Total Students'),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xff042B59),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 6, vertical: 6),
                      child: Row(
                        children: [
                          Text(
                            '${lectureModel.studentCount}',
                            style: const TextStyle(color: Colors.white),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Icon(
                            Icons.person,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          const Spacer(),
          ControlPanelSection(
            lectureModel: lectureModel,
          ),
          const Spacer(
            flex: 2,
          ),
        ],
      ),
    );
  }
}

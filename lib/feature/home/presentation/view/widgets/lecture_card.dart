import 'package:attendance/core/utils/app_routers.dart';
import 'package:attendance/feature/home/data/models/lecture_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LectureCard extends StatelessWidget {
  final LectureModel lecture;

  const LectureCard({super.key, required this.lecture});

  @override
  Widget build(BuildContext context) {
    print('${lecture.studentCount}');
    return GestureDetector(
      onTap: () async {
        User? user = FirebaseAuth.instance.currentUser;

        if (user != null) {
          print("user is arady exisit${user.email}");

          GoRouter.of(context).push(AppRouters.kLectureControlPanelView,  extra: lecture);
        } else {
          print('user did not sign in ');
          GoRouter.of(context).push(AppRouters.kAssistantControlView);
        }
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.only(right: 12),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "${lecture.studentCount} Students",
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              lecture.grade,
              style: const TextStyle(fontSize: 14, color: Colors.black54),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${lecture.startingDay} - ',
                  style: const TextStyle(fontSize: 14, color: Colors.black54),
                ),
                Text(
                  lecture.time != null
                      ? "${lecture.time!.hour}:${lecture.time!.minute} ${lecture.time!.hour >= 12 ? 'PM' : 'AM'}"
                      : "",
                  style: const TextStyle(fontSize: 14, color: Colors.black54),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

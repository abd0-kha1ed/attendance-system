import 'package:attendance/core/utils/app_routers.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LectureCard extends StatelessWidget {
  const LectureCard({super.key});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouters.kLectureControlPanelView);
      },
      child: const Card(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('104 Students'),
              Text('3rd Secondary'),
              Text('Sunday - 1:00 PM'),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:attendance/core/utils/app_routers.dart';
import 'package:attendance/feature/home/presentation/view/widgets/custom_control_panel.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ControlPanelSection extends StatelessWidget {
  const ControlPanelSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: CustomControlPanel(
                onTap: () {
                  GoRouter.of(context).push(AppRouters.kEditLectureView);
                },
                title: 'Edit Lecture',
                icon: Icons.edit,
                background: const Color(0xff042B59),
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            Expanded(
              child: CustomControlPanel(
                onTap: () {
                  GoRouter.of(context).push(AppRouters.kStudentListView);
                },
                title: 'Students List',
                icon: Icons.group,
                background: const Color(0xff0453b0),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: CustomControlPanel(
                onTap: () {
                  GoRouter.of(context).push(AppRouters.kAbsenceReportView);
                },
                title: 'Absence Report',
                icon: Icons.group,
                background: const Color(0xfff44236),
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            Expanded(
              child: CustomControlPanel(
                onTap: () {
                  GoRouter.of(context).push(AppRouters.kFeatureStudentView);
                },
                title: 'Featured Students',
                icon: Icons.star,
                iconColor: Colors.yellow,
                background: const Color(0xff042B59),
              ),
            ),
          ],
        )
      ],
    );
  }
}

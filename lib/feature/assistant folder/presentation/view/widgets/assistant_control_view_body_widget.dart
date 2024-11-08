import 'package:attendance/constant.dart';
import 'package:attendance/core/utils/app_routers.dart';
import 'package:attendance/feature/assistant%20folder/presentation/view/widgets/qr_scanner_screen.dart';
import 'package:attendance/feature/home/presentation/view/widgets/custom_control_panel.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class AssistnatControlViewBodyWidget extends StatelessWidget {
  const AssistnatControlViewBodyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: CustomControlPanel(
              onTap: () async {
                GoRouter.of(context).push(AppRouters.kQRScannerScreen);
              },
              title: 'Scan QrS',
              icon: FontAwesomeIcons.qrcode,
              background: kAppBarColor),
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
    );
  }
}

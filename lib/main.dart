import 'package:attendance/core/utils/app_routers.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Attendance());
}

class Attendance extends StatelessWidget {
  const Attendance({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouters.router,
    );
  }
}

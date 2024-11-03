import 'package:attendance/core/utils/app_routers.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() {
  runApp(const Attendance());
}

class Attendance extends StatelessWidget {
  const Attendance({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouters.router,
      builder: (context, child) => ResponsiveBreakpoints.builder(
        child: child!,
        breakpoints: [
          const Breakpoint(start: 0, end: 450, name: MOBILE),
          const Breakpoint(start: 451, end: 800, name: TABLET),
          const Breakpoint(start: 801, end: 1920, name: DESKTOP),
          const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
        ],
      ),
      
      // initialRoute: "/",
    );
  }
}

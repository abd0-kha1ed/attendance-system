import 'package:attendance/core/utils/app_routers.dart';
import 'package:attendance/feature/login/data/firebase_auth_repo.dart';

import 'package:attendance/feature/login/presentation/manger/login_cubit/auth_cubit.dart';
import 'package:attendance/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(Attendance());
}

class Attendance extends StatelessWidget {
  Attendance({super.key});
  final authrepo = FirebaseAuthRepo();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(authRepo: authrepo)..checkAuth(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouters.router,
        builder: (context, child) => ResponsiveWrapper.builder(child,
            maxWidth: 1200,
            minWidth: 480,
            defaultScale: true,
            breakpoints: [
              const ResponsiveBreakpoint.resize(480, name: MOBILE),
              const ResponsiveBreakpoint.autoScale(800, name: TABLET),
              const ResponsiveBreakpoint.resize(1000, name: DESKTOP),
            ],
            background: Container(color: const Color(0xFFF5F5F5))),
      ),
    );
  }
}

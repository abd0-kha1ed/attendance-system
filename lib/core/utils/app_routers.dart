import 'package:attendance/feature/home/presentation/view/home_view.dart';
import 'package:attendance/feature/login/presentation/view/login_view.dart';
import 'package:attendance/feature/splash/presentation/view/splash_view.dart';
import 'package:attendance/feature/splash/presentation/view/teacher_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouters {
  static const kLoginView = '/LoginView';
  static const kTeacherView = '/TeacherView';
  static final router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: kLoginView,
      builder: (context, state) => const LoginView(),
    ),
    GoRoute(
      path: kTeacherView,
      builder: (context, state) => const TeacherView(),
    )
  ]);
}

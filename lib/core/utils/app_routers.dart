import 'package:attendance/feature/home/presentation/view/home_view.dart';
import 'package:attendance/feature/login/presentation/view/login_view.dart';
import 'package:attendance/feature/splash/presentation/view/splash_view.dart';
import 'package:attendance/feature/splash/presentation/view/teacher_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouters {
  static const kLoginView = '/LoginView';
<<<<<<< HEAD
  static const kTeacherView = '/TeacherView';
=======
  static const kHomeView = '/homeView';
>>>>>>> adc660683a0fbb8f88f4101b7a66c30a7de908b9
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
<<<<<<< HEAD
      path: kTeacherView,
      builder: (context, state) => const TeacherView(),
=======
      path: kHomeView,
      builder: (context, state) => const HomeView(),
>>>>>>> adc660683a0fbb8f88f4101b7a66c30a7de908b9
    )
  ]);
}

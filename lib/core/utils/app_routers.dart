import 'package:attendance/feature/absence_report/presentation/view/absence_report_view.dart';
import 'package:attendance/feature/home/presentation/view/add_lecture_view.dart';
import 'package:attendance/feature/home/presentation/view/home_view.dart';
import 'package:attendance/feature/home/presentation/view/lecture_control_panel_view.dart';
import 'package:attendance/feature/login/presentation/view/login_view.dart';
import 'package:attendance/feature/splash/presentation/view/splash_view.dart';
import 'package:attendance/feature/studentList/presentation/views/featured_students_view.dart';
import 'package:attendance/feature/studentList/presentation/views/student_list_view.dart';
import 'package:attendance/feature/teacher/presentation/view/teacher_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouters {
  static const kLoginView = '/LoginView';
  static const kTeacherView = '/TeacherView';
  static const kHomeView = '/homeView';
  static const kLectureControlPanelView = '/lectureControlPanelView';
  static const kAddLectureView = '/addLectureView';
  static const kAbsenceReportView = '/absenceReportView';
  static const kStudentListView = '/StudentListView';
  static const kFeatureStudentView = '/FeatureStudentsView';
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
    ),
    GoRoute(
      path: kHomeView,
      builder: (context, state) => const HomeView(),
    ),
    GoRoute(
      path: kLectureControlPanelView,
      builder: (context, state) => const LectureControlPanelView(),
    ),
    GoRoute(
      path: kAddLectureView,
      builder: (context, state) => const AddLectureView(),
    ),
    GoRoute(
      path: kAbsenceReportView,
      builder: (context, state) => const AbsenceReportView(),
    ),
    GoRoute(
      path: kStudentListView,
      builder: (context, state) => const StudentListView(),
    ),
    GoRoute(
      path: kFeatureStudentView,
      builder: (context, state) => const FeaturedStudentsView(),
    ),
  ]);
}

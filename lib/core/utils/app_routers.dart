import 'package:attendance/feature/absence_report/presentation/view/absence_report_view.dart';
import 'package:attendance/feature/add_new_student/prisentation/view/add_new_student_view.dart';
import 'package:attendance/feature/edit_existing_student/prisentation/view/edit_existing_student.dart';
import 'package:attendance/feature/home/presentation/view/add_lecture_view.dart';
import 'package:attendance/feature/home/presentation/view/home_view.dart';
import 'package:attendance/feature/home/presentation/view/lecture_control_panel_view.dart';
import 'package:attendance/feature/login/presentation/view/login_view.dart';
import 'package:attendance/feature/splash/presentation/view/splash_view.dart';
import 'package:attendance/feature/studentList/presentation/views/featured_students_view.dart';
import 'package:attendance/feature/studentList/presentation/views/student_list_view.dart';
import 'package:attendance/feature/teacher/presentation/view/add_new_assistnat_view.dart';
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
  static const kEditExistingStudent = '/EditExistingStudent';
  static const kAddNewAssistant = '/AddNewAssistnat';
  static const kAddnewStudent = '/AddNewStudentView';
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
    GoRoute(
      path: kEditExistingStudent,
      builder: (context, state) => const EditExistingStudent(),
    ),
    GoRoute(
      path: kAddNewAssistant,
      builder: (context, state) => const AddNewAssistnatView(),
    ),
    GoRoute(
      path: kAddnewStudent,
      builder: (context, state) => const AddNewStudentView(),
    ),
  ]);
}

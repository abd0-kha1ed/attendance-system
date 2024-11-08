import 'package:attendance/feature/absence_report/presentation/view/absence_report_view.dart';
import 'package:attendance/feature/assistant%20folder/presentation/view/assistant_control_view.dart';
import 'package:attendance/feature/assistant%20folder/presentation/view/assistant_home_view.dart';
import 'package:attendance/feature/assistant%20folder/presentation/view/widgets/qr_scanner_screen.dart';
import 'package:attendance/feature/studentList/presentation/views/add_feature_student.dart';
import 'package:attendance/feature/studentList/presentation/views/add_new_student_view.dart';

import 'package:attendance/feature/edit_lecture/presentation/view/edit_lecture_view.dart';
import 'package:attendance/feature/home/presentation/view/add_lecture_view.dart';
import 'package:attendance/feature/home/presentation/view/home_view.dart';
import 'package:attendance/feature/home/presentation/view/lecture_control_panel_view.dart';
import 'package:attendance/feature/login/presentation/view/login_view.dart';
import 'package:attendance/feature/splash/presentation/view/splash_view.dart';
import 'package:attendance/feature/studentList/presentation/views/featured_students_view.dart';
import 'package:attendance/feature/studentList/presentation/views/student_list_view.dart';
import 'package:attendance/feature/teacher/presentation/manger/add_new_assistant_cubit/cubit/add_new_assistan_cubit.dart';
import 'package:attendance/feature/teacher/presentation/view/add_new_assistnat_view.dart';
import 'package:attendance/feature/teacher/presentation/view/teacher_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
  static const kAddNewStudent = '/AddNewStudentView';
  static const kEditLectureView = '/EditLectureView';
  static const kAddFeatureStudent = '/AddFeatureStudent';
  static const kAssistantHomeView = '/AssistantHomeView';
  static const kAssistantControlView = '/AssistantControlView';
  static const kQRScannerScreen = '/QRScannerScreen';

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
      path: kAddNewAssistant,
      builder: (context, state) => BlocProvider(
          create: (context) => AddNewAssistantCubit(),
          child: const AddNewAssistnatView()),
    ),
    GoRoute(
      path: kAddNewStudent,
      builder: (context, state) => const AddNewStudentView(),
    ),
    GoRoute(
      path: kEditLectureView,
      builder: (context, state) => const EditLectureView(),
    ),
    GoRoute(
      path: kAddFeatureStudent,
      builder: (context, state) => const AddFeatureStudent(),
    ),
    GoRoute(
      path: kAssistantHomeView,
      builder: (context, state) => const AssistantHomeView(),
    ),
    GoRoute(
      path: kAssistantControlView,
      builder: (context, state) => const AssistantControlView(),
    ),
    GoRoute(
        path: kQRScannerScreen,
        builder: (context, state) => const QRScannerScreen()),
  ]);
}

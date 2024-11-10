import 'package:attendance/constant.dart';
import 'package:attendance/core/widgets/custom_lift_arrow.dart';
import 'package:attendance/feature/home/data/models/lecture_model.dart';
import 'package:attendance/feature/studentList/presentation/views/widgets/student_list_view_body.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/app_routers.dart';
import '../../../../core/widgets/floating_action_button_widget.dart';

class StudentListView extends StatelessWidget {
  const StudentListView({
    super.key,
    required this.lectureModel,
  });
  final LectureModel lectureModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // actions: [
        //   Padding(
        //     padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
        //     child: GestureDetector(
        //       onTap: () async {
        //         final pdfDocument = await createPdfDocument('Your data here');
        //         Navigator.push(
        //           context,
        //           MaterialPageRoute(
        //             builder: (context) => PdfViewerPage(pdfDocument),
        //           ),
        //         );
        //       },
        //       child: Container(
        //         decoration: BoxDecoration(
        //             borderRadius: BorderRadius.circular(8), color: kLogoColor),
        //         width: 160,
        //         child: const Center(
        //             child: Text(
        //           'Export Data',
        //           style: TextStyle(color: Colors.white, fontSize: 18),
        //         )),
        //       ),
        //     ),
        //   )
        // ],

        automaticallyImplyLeading: false,

        title: const Text(
          'Students List',
          style: TextStyle(color: Colors.white),
        ),
        // centerTitle: true,
        backgroundColor: kAppBarColor,
        leading: IconButton(
          onPressed: () {},
          icon: const CustomLiftArrow(
            colorIcon: Colors.black,
            backgroundColor: Colors.white,
          ),
        ),
      ),
      body: StudentListViewBody(
        lecture: lectureModel,
      ),
      floatingActionButton: FloatingActionButtonWidget(
        onPressed: () {
          GoRouter.of(context)
              .push(AppRouters.kAddNewStudent, extra: lectureModel);
        },
      ),
    );
  }
}

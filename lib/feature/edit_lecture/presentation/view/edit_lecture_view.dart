import 'package:attendance/core/utils/firebase_services.dart';
import 'package:attendance/core/widgets/custom_lift_arrow.dart';
import 'package:attendance/core/widgets/custom_show_dialog.dart';
import 'package:attendance/feature/edit_lecture/presentation/view/widgets/edit_lecture_view_body.dart';
import 'package:attendance/feature/home/data/models/lecture_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class EditLectureView extends StatefulWidget {
  const EditLectureView({super.key, required this.lectureModel});
  final LectureModel lectureModel;

  @override
  State<EditLectureView> createState() => _EditLectureViewState();
}

class _EditLectureViewState extends State<EditLectureView> {
  final FirebaseServices firebaseServices = FirebaseServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            GoRouter.of(context).pop();
          },
          icon: const CustomLiftArrow(
            colorIcon: Colors.white,
            backgroundColor: Colors.black,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return CustomShowDialog(
                        onPressed: () async {
                          try {
                            await firebaseServices
                                .deleteLecture(widget.lectureModel.id);
                            print('delet succ${widget.lectureModel.id}');
                            // ignore: use_build_context_synchronously
                            GoRouter.of(context).pop();
                            // ignore: use_build_context_synchronously
                            GoRouter.of(context).pop();
                            // ignore: use_build_context_synchronously
                            GoRouter.of(context).pop();
                          } on Exception catch (e) {
                            print(e.toString());
                          }
                        },
                      );
                    });
              },
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
            ),
          ),
        ],
        title: const Text('Edit Lecture'),
        centerTitle: true,
      ),
      body: EditLectureViewBody(
        lectureModel: widget.lectureModel,
      ),
    );
  }
}

import 'package:attendance/core/utils/firebase_services.dart';
import 'package:attendance/core/widgets/whats_phone.dart';
import 'package:attendance/feature/teacher/data/models/add_assistant_model.dart';
import 'package:attendance/feature/teacher/presentation/view/widgets/item_teacher_assistant_listview.dart';
import 'package:flutter/material.dart';

class TeacherAssistantListView extends StatefulWidget {
  const TeacherAssistantListView({
    super.key,
  });
  

  @override
  State<TeacherAssistantListView> createState() =>
      _TeacherAssistantListViewState();
}

class _TeacherAssistantListViewState extends State<TeacherAssistantListView> {
  final FirebaseServices firebaseServices = FirebaseServices();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: firebaseServices.getAssistants(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (snapshot.hasData) {
            final List<AddAssistantModel> assistants = [];
            for (var doc in snapshot.data!.docs) {
              if (doc.exists && doc.data() != null) {
                assistants.add(
                  AddAssistantModel.fromJson({
                    'name': doc['name'],
                    'id': doc.id,
                    'email': doc['email'],
                    'password': doc['password'],
                    'phoneNumber': doc['phoneNumber'],
                  }),
                );
              }
            }
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: assistants.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        ItemTeacherAssistantListView(
                          assistantModel: assistants[index],
                        ),
                         WhatsPhone(phoneNumber: assistants[index].phoneNumber,),
                        const Divider(
                          indent: 40,
                          endIndent: 40,
                        )
                      ],
                    );
                  }),
            );
          } else {
            return const Text('loading');
          }
        });
  }
}

import 'package:attendance/constant.dart';
import 'package:attendance/core/widgets/custom_icon_button.dart';
import 'package:attendance/core/widgets/custom_lift_arrow.dart';
import 'package:attendance/core/widgets/whats_phone.dart';
import 'package:flutter/material.dart';

class TeacherViewBody extends StatelessWidget {
  const TeacherViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CustomLiftArrow(
          colorIcon: Colors.black,
          backgroundColor: Colors.white,
        ),
        backgroundColor: kAppBarColor,
        centerTitle: true,
        title: const Text(
          'My Assistants',
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: 8,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Icon(
                            Icons.person,
                            size: 50,
                          ),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Name'),
                              SizedBox(
                                // width: 230,
                                child: Text(
                                  'mahmoudahmedhsn@gmail.com',
                                  maxLines: 2,
                                ),
                              ),
                              Text('01125144905'),
                            ],
                          ),
                          CustomIconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.delete_forever,
                              size: 40,
                              color: Colors.red,
                            ),
                          )
                        ],
                      ),
                      const WhatsPhone(),
                      const Divider(
                        indent: 40,
                        endIndent: 40,
                      )
                    ],
                  );
                }),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
            child: GestureDetector(
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0XFF0453B0),
                  borderRadius: BorderRadius.circular(50),
                ),
                height: 50,
                child: const Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                      Text(
                        'Add New Assistant',
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

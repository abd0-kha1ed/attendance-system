import 'package:attendance/constant.dart';
import 'package:attendance/core/widgets/custom_lift_arrow.dart';
import 'package:attendance/feature/studentList/presentation/views/widgets/featured_students_view_body.dart';
import 'package:flutter/material.dart';

class FeaturedStudentsView extends StatelessWidget {
  const FeaturedStudentsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          overflow: TextOverflow.ellipsis,
          'Featured Students',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: kAppBarColor,
        leading: IconButton(
          onPressed: () {},
          icon: const CustomLiftArrow(
            colorIcon: Colors.black,
            backgroundColor: Colors.white,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
            child: GestureDetector(
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8), color: kLogoColor),
                width: 140,
                child: const Center(
                    child: Text(
                  'Export Data',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                )),
              ),
            ),
          )
        ],
      ),
      body: const FeaturedStudentsViewBody(),
    );
  }
}

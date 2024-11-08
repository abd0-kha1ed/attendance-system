import 'package:attendance/constant.dart';
import 'package:attendance/core/utils/assets.dart';
import 'package:attendance/core/widgets/custom_aler_dialog_widget.dart';
import 'package:attendance/feature/home/presentation/view/widgets/all_lecture_list_view.dart';
import 'package:flutter/material.dart';

class AssistantHomeViewBody extends StatelessWidget {
  const AssistantHomeViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          Assets.waveTop,
          width: MediaQuery.of(context).size.width,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Text(
                'Welcome',
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'mahmoud ahmed',
                style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              IconButton(
                style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.red)),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return const CustomAlertDialogWidget();
                      });
                },
                icon: const Icon(
                  Icons.logout_outlined,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Divider(),
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Lectures Today',
                style: TextStyle(fontSize: 20),
              ),
              Container(
                width: 180,
                height: 65,
                decoration: BoxDecoration(
                    color: kAppBarColor,
                    borderRadius: BorderRadius.circular(16)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: kLogoColor,
                          borderRadius: BorderRadius.circular(12)),
                      height: 45,
                      width: 90,
                      child: const Center(
                        child: Text(
                          'Friday',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    const Text(
                      '01:32 Am',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        const AllLectureListView(),
        Image.asset(Assets.waveBottom),
      ],
    );
  }
}

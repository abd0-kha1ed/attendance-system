import 'package:attendance/feature/home/presentation/view/widgets/lecture_card.dart';
import 'package:flutter/material.dart';

class LectureCardListView extends StatelessWidget {
  const LectureCardListView({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Row(
            children: [
              Text(
                'Abo hamad',
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 1 / 7,
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: 7,
                itemBuilder: (context, index) {
                  return const LectureCard();
                }),
          )
        ],
      ),
    );
  }
}

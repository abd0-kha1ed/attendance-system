import 'package:attendance/feature/home/presentation/view/widgets/lecture_card_list_view.dart';
import 'package:flutter/material.dart';

class AllLectureListView extends StatelessWidget {
  const AllLectureListView({super.key});
  @override
  Widget build(BuildContext context) {
    return const Flexible(
      fit: FlexFit.loose,
      child: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: LectureCardListView(),
          ),
          SliverToBoxAdapter(
            child: LectureCardListView(),
          ),
          SliverToBoxAdapter(
            child: LectureCardListView(),
          ),
          SliverToBoxAdapter(
            child: LectureCardListView(),
          )
        ],
      ),
    );
  }
}

import 'package:attendance/core/utils/assets.dart';
<<<<<<< HEAD

import 'package:attendance/feature/splash/presentation/view/teacher_view.dart';
=======
import 'package:attendance/feature/home/presentation/view/home_view.dart';
>>>>>>> adc660683a0fbb8f88f4101b7a66c30a7de908b9
import 'package:flutter/material.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;

  @override
  void initState() {
    super.initState();
    initSlidingAnimation();
    navigateToHomeView();
  }

  @override
  void setState(VoidCallback fn) {
    void dispose() {
      super.dispose();
      animationController.dispose();
    }

    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(
            Assets.logo,
          ),
          const SizedBox(height: 20),
          const SizedBox(height: 40),
          const Center(
            child: CircularProgressIndicator(
              color: Color(0xff042B59),
            ),
          ),
        ],
      ),
    );
  }

  void navigateToHomeView() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.push(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(
          builder: (context) {
<<<<<<< HEAD
            return const TeacherView();
=======
            return const HomeView();
>>>>>>> adc660683a0fbb8f88f4101b7a66c30a7de908b9
          },
        ),
      );
    });
  }

  void initSlidingAnimation() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    slidingAnimation =
        Tween<Offset>(begin: const Offset(0, 15), end: Offset.zero)
            .animate(animationController);

    animationController.forward();
  }
}

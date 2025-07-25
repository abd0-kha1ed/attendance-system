import 'package:attendance/core/utils/assets.dart';
import 'package:attendance/feature/home/presentation/view/home_view.dart';
import 'package:attendance/feature/login/presentation/manger/login_cubit/auth_cubit.dart';
import 'package:attendance/feature/login/presentation/view/login_view.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    // ignore: unused_element
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
          SizedBox(
            height: 320,
            width: 200,
            child: Image.asset(
              Assets.logo,
            ),
          ),
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
        context,
        MaterialPageRoute(
          builder: (context) {
            return BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is AuthErrorState) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(const SnackBar(content: Text('error')));
                }
              },
              builder: (context, state) {
                if (state is UnAuthenticatedState) {
                  return const LoginView();
                } else if (state is AuthenticatedState) {
                  return const HomeView();
                } else {
                  return const Scaffold(
                    body: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
              },
            );
          },
        ),
      );
    });
  }

  void initSlidingAnimation() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    slidingAnimation =
        Tween<Offset>(begin: const Offset(0, 30), end: Offset.zero)
            .animate(animationController);

    animationController.forward();
  }
}

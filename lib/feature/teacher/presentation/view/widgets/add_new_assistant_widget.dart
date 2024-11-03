import 'package:attendance/core/utils/app_routers.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AddNewAssisstantWidget extends StatelessWidget {
  const AddNewAssisstantWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouters.kAddNewAssistant);
      },
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
    );
  }
}

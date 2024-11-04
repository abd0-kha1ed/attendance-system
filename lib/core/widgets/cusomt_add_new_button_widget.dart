import 'package:flutter/material.dart';

class CustomAddNewbuttonWidget extends StatelessWidget {
  const CustomAddNewbuttonWidget(
      {super.key, required this.text, this.icons, this.onTap});
  final String text;
  final IconData? icons;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0XFF0453B0),
          borderRadius: BorderRadius.circular(50),
        ),
        height: 50,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icons,
                color: Colors.white,
              ),
              Text(
                text,
                style: const TextStyle(color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}

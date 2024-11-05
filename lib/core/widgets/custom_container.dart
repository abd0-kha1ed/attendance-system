import 'package:attendance/constant.dart';
import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer(
      {super.key, required this.text, this.onTap, this.isloading = false});
  final String text;
  final void Function()? onTap;
  final bool isloading;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          color: kLogoColor,
          borderRadius: BorderRadius.circular(12),
        ),
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: isloading
              ? const SizedBox(
                  height: 24,
                  width: 24,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                )
              : Text(
                  text,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
        ),
      ),
    );
  }
}

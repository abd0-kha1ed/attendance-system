import 'package:flutter/material.dart';

class CustomControlPanel extends StatelessWidget {
  const CustomControlPanel(
      {super.key,
      required this.title,
      required this.icon,
      required this.background,
      this.iconColor = Colors.white,
      this.onTap});
  final String title;
  final IconData icon;
  final Color background;
  final Color iconColor;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 32),
        decoration: BoxDecoration(
            color: background, borderRadius: BorderRadius.circular(12)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: iconColor,
              size: 46,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(
                textAlign: TextAlign.center,
                maxLines: 2,
                title,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


import 'package:flutter/material.dart';

class CustomControlPanel extends StatelessWidget {
  const CustomControlPanel(
      {super.key,
      required this.title,
      required this.icon,
      required this.background,
      this.iconColor = Colors.white});
  final String title;
  final IconData icon;
  final Color background;
  final Color iconColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.141,
      width: MediaQuery.of(context).size.width * 0.28,
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
    );
  }
}

import 'package:attendance/core/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WhatsPhone extends StatelessWidget {
  const WhatsPhone({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CustomIconButton(
          icon: Icon(
            FontAwesomeIcons.whatsapp,
            color: Colors.green,
          ),
        ),
        CustomIconButton(
            icon: Icon(
          Icons.phone,
          color: Colors.green,
        ))
      ],
    );
  }
}

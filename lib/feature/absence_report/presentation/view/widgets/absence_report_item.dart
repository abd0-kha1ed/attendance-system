
import 'package:attendance/constant.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AbsenceReportItem extends StatelessWidget {
  const AbsenceReportItem({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: kAppBarColor,
              ),
              child: const Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  '121',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'رحمه فوزي محمد',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text('Absence on 11 out of 100 lecture'),
                ],
              ),
            )
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                child: Text(
                  'Absence Days',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const Spacer(),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                FontAwesomeIcons.whatsapp,
                color: Colors.green,
              ),
            ),
            const Spacer(),
            const Column(
              children: [
                Text('Sunday, September 8, 2024'),
                Text('Sunday, September 8, 2024'),
                Text('Sunday, September 8, 2024'),
                Text('Sunday, September 8, 2024'),
                Text('Sunday, September 8, 2024'),
                Text('Sunday, September 8, 2024'),
                Text('Sunday, September 8, 2024'),
              ],
            )
          ],
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 16),
          child: Divider(),
        ),
      ],
    );
  }
}
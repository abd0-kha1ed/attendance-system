import 'package:flutter/material.dart';

void main() => runApp(DropdownExampleApp());

class DropdownExampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DropdownExample(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class DropdownExample extends StatefulWidget {
  @override
  _DropdownExampleState createState() => _DropdownExampleState();
}

class _DropdownExampleState extends State<DropdownExample> {
  String selectedGrade = '3rd Secondary'; // Initial value
  String selectedRegion = 'Region'; // Initial value

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Grade Dropdown

            DropdownButton<String>(
              value: selectedGrade,
              items: <String>['3rd Secondary', '2nd Secondary', '1st Secondary']
                  .map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedGrade = newValue!;
                });
              },
              isExpanded: false,
              dropdownColor: Colors.white, // Dropdown background color
              style: TextStyle(color: Colors.black), // Text color
            ),
            SizedBox(height: 16),

            // Region Dropdown
          ],
        ),
      ),
    );
  }
}

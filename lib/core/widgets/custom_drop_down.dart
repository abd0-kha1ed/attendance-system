// import 'package:flutter/material.dart';

// class CustomDropDown extends StatefulWidget {
//   @override
//   _CustomDropDownState createState() => _CustomDropDownState();
// }

// class _CustomDropDownState extends State<CustomDropDown> {
//   String selectedRegion = 'Region'; // Default initial value

//   List<String> regions = [
//     'Abo hamad',
//     'Zagazig',
//     '10th of ramadan',
//     'Dyarb negm',
//     'Minya el qamh',
//     'Almogaze',
//     'Shnbara',
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Region Dropdown Example"),
//       ),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 'Region',
//                 style: TextStyle(fontSize: 16),
//               ),
//               SizedBox(height: 8),
//               DropdownButton<String>(
//                 value: selectedRegion,
//                 items: regions.map((String value) {
//                   return DropdownMenuItem<String>(
//                     value: value,
//                     child: Text(value),
//                   );
//                 }).toList(),
//                 onChanged: (String? newValue) {
//                   setState(() {
//                     selectedRegion = newValue!;
//                   });
//                 },
//                 isExpanded: true,
//                 dropdownColor:
//                     Colors.white, // Background color of dropdown menu
//                 style: TextStyle(color: Colors.black), // Text color
//                 iconEnabledColor: Colors.blue, // Dropdown arrow color
//                 underline: Container(
//                   height: 2,
//                   color: Colors.blue, // Underline color
//                 ),
//                 iconSize: 24,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

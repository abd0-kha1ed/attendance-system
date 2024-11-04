
import 'package:attendance/constant.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomDropdownButton extends StatefulWidget {
  const CustomDropdownButton({super.key, required this.items});
  final List<String> items;

  @override
  _CustomDropdownButtonState createState() => _CustomDropdownButtonState();
}

class _CustomDropdownButtonState extends State<CustomDropdownButton> {
  String? selectedValue;

  @override
  void initState() {
    super.initState();
    _loadLastSelectedValue();
  }

  Future<void> _loadLastSelectedValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedValue = prefs.getString('lastSelectedValue') ?? widget.items[0];
    });
  }

  Future<void> _saveLastSelectedValue(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('lastSelectedValue', value);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 170,
      child: DropdownButtonFormField<String>(
        iconEnabledColor: Colors.white,
        decoration: InputDecoration(
          filled: true,
          fillColor: kAppBarColor,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        value: selectedValue,
        onChanged: (String? newValue) {
          setState(() {
            selectedValue = newValue!;
          });
          _saveLastSelectedValue(newValue!);
        },
        items: widget.items.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: const TextStyle(color: Colors.black),
            ),
          );
        }).toList(),
        selectedItemBuilder: (BuildContext context) {
          return widget.items.map((String value) {
            return Text(
              value,
              style: const TextStyle(color: Colors.white),
            );
          }).toList();
        },
        style: const TextStyle(color: Colors.black),
      ),
    );
  }
}

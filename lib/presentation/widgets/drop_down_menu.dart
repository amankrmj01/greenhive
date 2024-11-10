import 'package:flutter/material.dart';

import '../../consts/crop_types.dart';

class CropTypeDropdown extends StatefulWidget {
  final ValueChanged<String?> onChanged;
  final String? initialValue;

  const CropTypeDropdown(
      {super.key, required this.onChanged, this.initialValue});

  @override
  CropTypeDropdownState createState() => CropTypeDropdownState();
}

class CropTypeDropdownState extends State<CropTypeDropdown> {
  String? _selectedCropType;

  @override
  void initState() {
    super.initState();
    _selectedCropType = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color.lerp(Colors.white, Colors.teal, 0.1),
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
            color: Colors.black), // Optional: Add border to match MyTextArea
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          borderRadius: BorderRadius.circular(10),
          itemHeight: 60,
          value: _selectedCropType,
          hint: const Text('Choose'),
          style: TextStyle(
            fontWeight: FontWeight.w400,
            color: Colors.black.withOpacity(0.9),
            fontSize: 18,
          ),
          items: cropTypes.map((String cropType) {
            return DropdownMenuItem<String>(
              value: cropType,
              child: Text(cropType),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              _selectedCropType = newValue;
            });
            widget.onChanged(newValue);
          },
        ),
      ),
    );
  }
}

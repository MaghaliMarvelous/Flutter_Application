import 'package:flutter/material.dart';

class GenderSelector extends StatelessWidget {
  final int selectedGender;
  final ValueChanged<int> onChanged;

  const GenderSelector({
    super.key,
    required this.selectedGender,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Select your gender'),
        Row(
          children: [
            _buildRadio(0, 'Male'),
            _buildRadio(1, 'Female'),
          ],
        ),
      ],
    );
  }

  Widget _buildRadio(int value, String label) {
    return Row(
      children: [
        Radio(
          value: value,
          groupValue: selectedGender,
          onChanged: (val) => onChanged(val as int),
        ),
        Text(label),
      ],
    );
  }
}

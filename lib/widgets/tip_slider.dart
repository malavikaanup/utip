import 'package:flutter/material.dart';

class TipSlider extends StatelessWidget {
  const TipSlider({
    super.key,
    required double tipValue,
    required this.onChanged,
  }) : _tipValue = tipValue;

  final double _tipValue;
  final ValueChanged<double> onChanged;

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: _tipValue,
      onChanged: onChanged,
      // onChanged: (value) {
      //   // setState(() {
      //   //   _tipValue = value;
      //   // });
      //   print(value);
      // },
      min: 0,
      max: 0.5,
      label: '${_tipValue * 100}',
      divisions: 5,
    );
  }
}

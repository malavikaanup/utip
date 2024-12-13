import 'package:flutter/material.dart';

class TipSlider extends StatelessWidget {
  const TipSlider({
    super.key,
    required double tipPercent,
    required this.onChanged,
  }) : _tipPercent = tipPercent;

  final double _tipPercent;
  final ValueChanged<double> onChanged;

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: _tipPercent,
      onChanged: onChanged,
      min: 0,
      max: 0.5,
      label: '${(_tipPercent * 100).round()}%',
      divisions: 5,
    );
  }
}

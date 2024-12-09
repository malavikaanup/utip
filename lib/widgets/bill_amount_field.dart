import 'package:flutter/material.dart';

class BillAmountField extends StatelessWidget {
  const BillAmountField({
    super.key,
    required this.billAmount,
    required this.onChanged,
  });

  final String billAmount;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Bill Amount',
        prefixIcon: Icon(Icons.attach_money),
      ),
      keyboardType: TextInputType.number,
      onChanged: (value) {
        onChanged(value);
      },
    );
  }
}

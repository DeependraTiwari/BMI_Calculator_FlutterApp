import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WeightInput extends StatelessWidget {
  final TextEditingController controller;
  final String unit;
  final Function(String?) onUnitChanged;

  const WeightInput({
    super.key,
    required this.controller,
    required this.unit,
    required this.onUnitChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Weight",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),

        const SizedBox(height: 8),

        DropdownButtonFormField<String>(
          initialValue: unit,
          decoration: const InputDecoration(
            labelText: "Weight Unit",
          ),
          items: const [
            DropdownMenuItem(value: "kg", child: Text("Kilograms")),
            DropdownMenuItem(value: "t", child: Text("Tons")),
          ],
          onChanged: onUnitChanged,
        ),

        const SizedBox(height: 12),

        TextField(
          controller: controller,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
          ],
          decoration: const InputDecoration(
            labelText: "Weight",
          ),
        ),
      ],
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HeightInput extends StatelessWidget {
  final TextEditingController controller1;
  final TextEditingController controller2;
  final String unit;
  final Function(String?) onUnitChanged;

  const HeightInput({
    super.key,
    required this.controller1,
    required this.controller2,
    required this.unit,
    required this.onUnitChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Height",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),

        const SizedBox(height: 8),

        DropdownButtonFormField<String>(
          initialValue: unit,
          decoration: const InputDecoration(
            labelText: "Height Unit",
          ),
          items: const [
            DropdownMenuItem(value: "ft_in", child: Text("Feet + Inches")),
            DropdownMenuItem(value: "ft", child: Text("Feet")),
            DropdownMenuItem(value: "in", child: Text("Inches")),
            DropdownMenuItem(value: "cm", child: Text("Centimeters")),
            DropdownMenuItem(value: "m", child: Text("Meters")),
          ],
          onChanged: onUnitChanged,
        ),

        const SizedBox(height: 12),

        Row(
          children: [
            Expanded(
              child: TextField(
                controller: controller1,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
                ],
                decoration: const InputDecoration(
                  labelText: "Value",
                ),
              ),
            ),

            if (unit == "ft_in") const SizedBox(width: 10),

            if (unit == "ft_in")
              Expanded(
                child: TextField(
                  controller: controller2,
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                        RegExp(r'^\d*\.?\d*')),
                  ],
                  decoration: const InputDecoration(
                    labelText: "Inches",
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }
}
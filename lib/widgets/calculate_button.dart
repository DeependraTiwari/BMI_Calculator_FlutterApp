import 'package:flutter/material.dart';

class CalculateButton extends StatelessWidget {
  final VoidCallback onCalculate;
  final VoidCallback onReset;

  const CalculateButton({
    super.key,
    required this.onCalculate,
    required this.onReset,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: onCalculate,
            child: const Text("Calculate BMI"),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: OutlinedButton(
            onPressed: onReset,
            child: const Text("Reset"),
          ),
        ),
      ],
    );
  }
}
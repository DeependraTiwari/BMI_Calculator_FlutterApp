import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class BMIGauge extends StatelessWidget {
  final double bmi;

  const BMIGauge({super.key, required this.bmi});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: SfRadialGauge(
        axes: [
          RadialAxis(
            minimum: 0,
            maximum: 40,
            showTicks: false,
            showLabels: false,
            ranges: [
              GaugeRange(
                startValue: 0,
                endValue: 18.5,
                color: Colors.yellow,
                startWidth: 20,
                endWidth: 20,
              ),
              GaugeRange(
                startValue: 18.5,
                endValue: 24.9,
                color: Colors.green,
                startWidth: 20,
                endWidth: 20,
              ),
              GaugeRange(
                startValue: 25,
                endValue: 40,
                color: Colors.red,
                startWidth: 20,
                endWidth: 20,
              ),
            ],
            pointers: [
              NeedlePointer(
                value: bmi,
                enableAnimation: true,
                animationDuration: 800,
              )
            ],
            annotations: [
              GaugeAnnotation(
                widget: Text(
                  bmi == 0 ? "--" : bmi.toStringAsFixed(1),
                  style: const TextStyle(
                      fontSize: 28, fontWeight: FontWeight.bold),
                ),
                angle: 90,
                positionFactor: 0.5,
              )
            ],
          )
        ],
      ),
    );
  }
}
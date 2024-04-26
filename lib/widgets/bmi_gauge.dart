import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class BMIGauge extends StatelessWidget {
  final double bmi;

  BMIGauge({required this.bmi});

  @override
  Widget build(BuildContext context) {
    return SfRadialGauge(
      axes: <RadialAxis>[
        RadialAxis(
          minimum: 10,
          maximum: 40,
          ranges: <GaugeRange>[
            GaugeRange(
              startValue: 10,
              endValue: 18.5,
              color: Colors.blue,
              label: 'Underweight',
            ),
            GaugeRange(
              startValue: 18.5,
              endValue: 25,
              color: Colors.green,
              label: 'Normal',
            ),
            GaugeRange(
              startValue: 25,
              endValue: 30,
              color: Colors.orange,
              label: 'Overweight',
            ),
            GaugeRange(
              startValue: 30,
              endValue: 40,
              color: Colors.red,
              label: 'Obese',
            ),
          ],
          pointers: <GaugePointer>[
            NeedlePointer(
              value: bmi,
              enableAnimation: true,
              animationDuration: 1000,
            ),
          ],
          annotations: <GaugeAnnotation>[
            GaugeAnnotation(
              widget: Text(
                'BMI: $bmi',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              angle: 90,
              positionFactor: 0.5,
            ),
          ],
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_device_status/components/neu_box.dart';
import 'package:flutter_device_status/themes/text_theme.dart';

import 'package:syncfusion_flutter_gauges/gauges.dart';

Widget gaugeChart(double used,String title) {
  final double free = 100 - used;
  return NeuBox(
    child: Center(

      child: Padding(
         padding: const EdgeInsets.fromLTRB(40, 40, 40, 0),
        child: Column(
          children: [SfRadialGauge(
            axes: <RadialAxis>[
              RadialAxis(
                showAxisLine: false,
                showLabels: false,
                showTicks: false,
                startAngle: 180,
                endAngle: 0,
                minimum: 0,
                maximum: 100,
                // interval: 10,
                radiusFactor: 1,
                
                ranges: <GaugeRange>[
                  GaugeRange(
                    startWidth: 40,
                    endWidth: 40,
                    startValue: 0,
                    endValue: used,
                    color: Colors.blue,
                  ),
                  GaugeRange(
                    startWidth: 40,
                    endWidth: 40,
                    startValue: free,
                    endValue: 100,
                    color: Colors.grey.shade100,
                  ),
                ],
                annotations:  [
                  GaugeAnnotation(
                    widget: Text(
                      '$used %',
                      style: bodyTextTheme,
                    ),
                    angle: 90,
                    // positionFactor: 0.5,
                  ),
                ],
                // pointers:  <GaugePointer>[
                  // NeedlePointer(
                  //   value: used,
                  //   enableAnimation: true,
                  //   animationDuration: 1000,
                  //   animationType: AnimationType.ease,
                  //   needleColor: Colors.black,
                  //   needleStartWidth: 1,
                  //   needleEndWidth: 5,
                  //   knobStyle: const KnobStyle(
                  //     knobRadius: 0.08,
                  //     sizeUnit: GaugeSizeUnit.factor,
                  //     borderColor: Colors.black,
                  //     color: Colors.white,
                  //     borderWidth: 0.035,
                  //   ),
                  // ),
                // ],
              ),
            ],
          ),
          Text(title,style: bodyTextTheme,),
          ],
          
        ),
      ),
    ),
  );
}
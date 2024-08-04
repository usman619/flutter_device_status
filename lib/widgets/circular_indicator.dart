import 'package:flutter/material.dart';
import 'package:flutter_device_status/components/neu_box.dart';
import 'package:flutter_device_status/themes/text_theme.dart';

import 'package:syncfusion_flutter_gauges/gauges.dart';

Widget gaugeChart(double used,String title, {String subtitle = ''}) {
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
                // startAngle: ,
                // endAngle: 360,
                minimum: 0,
                maximum: 100,
                // interval: 10,
                radiusFactor: 0.8,
                
                ranges: <GaugeRange>[
                  GaugeRange(
                    startWidth: 35,
                    endWidth: 35,
                    startValue: 0,
                    endValue: used,
                    color: Colors.blue,
                  ),
                  GaugeRange(
                    startWidth: 35,
                    endWidth: 35,
                    startValue: used,
                    endValue: 100,
                    color: Colors.grey.shade100,
                  ),
                ],
                annotations:  [
                  GaugeAnnotation(
                    widget: Text(
                      '$used %',
                      style: titleTextTheme,
                    ),
                    angle: 90,
                    // positionFactor: 0.5,
                  ),
                  GaugeAnnotation(widget: Text(subtitle,style: bodyTextTheme),angle: 90,),
                ],
              ),
            ],
          ),
          // Text(subtitle,style: bodyTextTheme,),
          Text(title,style: titleTextTheme,),
          const SizedBox(height: 10,),
          ],
          
        ),
      ),
    ),
  );
}
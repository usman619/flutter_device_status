import 'package:flutter/material.dart';
import 'package:flutter_device_status/components/neu_box.dart';
import 'package:flutter_device_status/themes/text_theme.dart';

import 'package:syncfusion_flutter_gauges/gauges.dart';




// class Testing extends StatelessWidget {
//   const Testing({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: gaugeChart(50),
        
//     );
//   }
// }

Widget gaugeChart(double used) {
  final double free = 100 - used;
  return Padding(padding: const EdgeInsets.all(40),
        child: NeuBox(
          child: Center(
            child: SfRadialGauge(
              axes: <RadialAxis>[
                RadialAxis(
                  showAxisLine: false,
                  showLabels: false,
                  showTicks: false,
                  minimum: 0,
                  maximum: 100,
                  interval: 10,
                  radiusFactor: 0.9,
                  ranges: <GaugeRange>[
                    GaugeRange(
                      startWidth: 45,
                      endWidth: 45,
                      startValue: 0,
                      endValue: used,
                      color: Colors.blue,
                    ),
                    GaugeRange(
                      startWidth: 45,
                      endWidth: 45,
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
                      positionFactor: 0.5,
                    ),
                  ],
                  pointers:  <GaugePointer>[
                    NeedlePointer(
                      value: used,
                      enableAnimation: true,
                      animationDuration: 1000,
                      animationType: AnimationType.ease,
                      needleColor: Colors.black,
                      needleStartWidth: 1,
                      needleEndWidth: 5,
                      knobStyle: const KnobStyle(
                        knobRadius: 0.08,
                        sizeUnit: GaugeSizeUnit.factor,
                        borderColor: Colors.black,
                        color: Colors.white,
                        borderWidth: 0.035,
                      ),
                    ),


                  ],
                ),
              ],
            ),
          ),
        ),
      
  );
}


// import 'package:gauge_chart/gauge_chart.dart';
// class ChartData {
//   final String x;
//   final int y;

//   ChartData(this.x, this.y);
// }
// Widget gaugeChart(){
//   return Padding(
//         padding: const EdgeInsets.all(20),
//         child: NeuBox(
//           child: Center(
//             child: GaugeChart(
//                   isHalfChart: true,
//                   children: [
//                     PieData(
//                       value: 10,
//                       color: Colors.green.shade700,
//                       description: "Used",
//                     ),
//                     PieData(
//                       value: 10,
//                       color: Colors.grey.shade100,
//                       description: "Free",
//                     ),
                    
//                   ],
//                   gap: 1.85,
//                   animateDuration: const Duration(seconds: 1),
//                   start: 180,
                  
                  
//                   displayIndex: 1,
//                   shouldAnimate: true,
                  
//                   animateFromEnd: false,
                  
//                   size: 200,
//                   showValue: false,
//                   borderWidth: 25,
//                   centerText: const ['Taken'],
//                 ),
//           ),
//         ),
//       );
// }
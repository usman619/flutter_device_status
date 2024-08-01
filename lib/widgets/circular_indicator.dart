import 'package:flutter/material.dart';
import 'package:flutter_device_status/components/neu_box.dart';
import 'package:gauge_chart/gauge_chart.dart';


class ChartData {
  final String x;
  final int y;

  ChartData(this.x, this.y);
}

class Testing extends StatelessWidget {
  const Testing({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: NeuBox(
          child: Center(
            child: GaugeChart(
                  isHalfChart: true,
                  children: [
                    PieData(
                      value: 10,
                      color: Colors.green.shade700,
                      description: "Used",
                    ),
                    PieData(
                      value: 10,
                      color: Colors.grey.shade100,
                      description: "Free",
                    ),
                    
                  ],
                  gap: 1.85,
                  animateDuration: const Duration(seconds: 1),
                  start: 180,
                  
                  
                  displayIndex: 1,
                  shouldAnimate: true,
                  
                  animateFromEnd: false,
                  
                  size: 200,
                  showValue: false,
                  borderWidth: 25,
                  centerText: const ['Taken'],
                ),
          ),
        ),
      ),
        
    );
  }
}


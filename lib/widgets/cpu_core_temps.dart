import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';


class TestingWidgets extends StatelessWidget {
  const TestingWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Testing Widgets'),
        backgroundColor: Theme.of(context).colorScheme.surface,
      ),
      body: Column(
        children: <Widget>[
          const Text('Testing Widgets'),
          cpuCoreTemps(),
        ],
      ),
    );
  }


Widget cpuCoreTemps(){
  return SizedBox(
    height: 200,
    child: LineChart(
      LineChartData(
        lineBarsData: [
          LineChartBarData(
            spots: const [
              FlSpot(0, 1),
              FlSpot(1, 2),
              FlSpot(2, 3),
              FlSpot(3, 4),
              FlSpot(4, 5),
              FlSpot(5, 6),
              FlSpot(6, 7),
              FlSpot(7, 8),
            ],
          ),
        ],
      ),
    ),
  );
}
}

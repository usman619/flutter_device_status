import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_device_status/data/computer_data.dart';


class TestingWidgets extends StatefulWidget {
  const TestingWidgets({super.key});

  @override
  State<TestingWidgets> createState() => _TestingWidgetsState();
}

class _TestingWidgetsState extends State<TestingWidgets> {
  ComputerData computerData = ComputerData.emptyData();
  List<FlSpot> core0 = [];
  List<FlSpot> core1 = [];
  List<FlSpot> core2 = [];
  List<FlSpot> core3 = [];
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
          _updateCpuCoreTemps1(computerData, core0)
        ],
      ),
    );
  }

Widget cpuCoreTemps(){
  return SizedBox(
    height: 200,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: LineChart(
        LineChartData(
          titlesData: const FlTitlesData(
            show: true,
            rightTitles: AxisTitles(
              // Make it disapear
              sideTitles: SideTitles(showTitles: false),
            ),
            topTitles: AxisTitles(
              // Make it disapear
              sideTitles: SideTitles(showTitles: false),
            ),
          ),
          maxY: 100,
          lineBarsData: [
            LineChartBarData(
              spots: const [
                FlSpot(0, 0),
                FlSpot(1, 3),
                FlSpot(2, 4),
                FlSpot(3, 4),
                FlSpot(4, 4),
                FlSpot(5, 8),
                FlSpot(6, 50),
                FlSpot(7, 8),
              ],
              color: Colors.blue,
              
              barWidth: 2,
              isCurved: true,
              curveSmoothness: 0.35,
              preventCurveOverShooting: true,
              dotData: const FlDotData(show: false),
            ),
            LineChartBarData(
              spots: const [
                FlSpot(0, 2),
                FlSpot(1, 1),
                FlSpot(2, 0),
                FlSpot(3, 1),
                FlSpot(4, 2),
                FlSpot(5, 7),
                FlSpot(6, 1),
                FlSpot(7, 5),
              ],
              color: Colors.red,
              
              
              barWidth: 2,
              isCurved: true,
              curveSmoothness: 0.35,
              preventCurveOverShooting: true,
              dotData: const FlDotData(show: false),
            ),
          ],
        ),
        
      ),
    ),
    
  );
}

_updateCpuCoreTemps1(ComputerData computerData,List<FlSpot> core0) {
  // Update the CPU core temps
  int updateTime = 30;
  debugPrint('Updating CPU core temps...');
  print(computerData.getParsedCoreTemps());
}
}

import 'package:d_chart/d_chart.dart';
import 'package:flutter/material.dart';

class PieChart extends StatelessWidget {
  const PieChart({Key? key, required this.pieData}) : super(key: key);
  final List<Map<String, dynamic>> pieData;

  @override
  Widget build(BuildContext context) {
    return DChartPie(
      data: pieData,
      fillColor: (pieData, index) {
        switch (pieData['domain']) {
          case 'Flutter':
            return Colors.purple.shade300;
          case 'React Native':
            return Colors.purple.shade500;
          case 'Ionic':
            return Colors.purple.shade700;
          default:
            return Colors.purple.shade900;
        }
      },
      pieLabel: (pieData, index) {
        return "${pieData['domain']}";
      },
      labelPosition: PieLabelPosition.auto,
      labelColor: Colors.white,
      labelFontSize: 14,
      labelLineColor: Colors.grey,
    );
  }
}

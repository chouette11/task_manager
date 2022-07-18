import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class CustomPieChart extends StatelessWidget {
  const CustomPieChart({Key? key,
    required this.pieData,
    required this.colors
  }) : super(key: key);
  final Map<String, double> pieData;
  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          PieChart(
            dataMap: pieData,
            initialAngleInDegree: 270,
            colorList: colors,
          ),
        ],
      ),
    );
  }
}

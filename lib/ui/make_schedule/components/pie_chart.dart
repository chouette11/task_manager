import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class CustomPieChart extends StatelessWidget {
  const CustomPieChart({Key? key,
    required this.pieData,
    required this.colors,
    required this.legends
  }) : super(key: key);
  final Map<String, double> pieData;
  final List<Color> colors;
  final Map<String, Color> legends;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: PieChart(
              dataMap: pieData,
              initialAngleInDegree: 270,
              colorList: colors,
              legendOptions: LegendOptions(
                showLegends: false,
              ),
            ),
          ),
          Expanded(
            child: LegendListView(legends: legends),
          ),
        ],
      ),
    );
  }
}

class LegendListView extends StatelessWidget {
  const LegendListView({Key? key, required this.legends}) : super(key: key);
  final Map<String, Color> legends;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: legends.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.only(top: 4, bottom: 4),
          child: Row(
            children: [
              Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: legends.values.toList()[index],
                ),
              ),
              SizedBox(width: 4),
              Flexible(
                child: Text(
                  legends.keys.toList()[index],
                  overflow: TextOverflow.clip,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

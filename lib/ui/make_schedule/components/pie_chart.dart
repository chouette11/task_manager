import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class CustomPieChart extends StatelessWidget {
  const CustomPieChart({Key? key,
    required this.pieData,
    required this.colors,
    required this.legends,
    required this.initialAngle
  }) : super(key: key);
  final Map<String, double> pieData;
  final List<Color> colors;
  final Map<String, Color> legends;
  final double initialAngle;

  @override
  Widget build(BuildContext context) {
    final mediaSize = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    return SizedBox(
      height: 200,
      width: mediaSize.width,
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: PieChart(
                    dataMap: pieData,
                    initialAngleInDegree: initialAngle + 270 > 360 ?
                    initialAngle - 90 : initialAngle + 270,
                    colorList: colors,
                    legendOptions: LegendOptions(
                      showLegends: false,
                    ),
                  ),
                ),
                Positioned(
                  child: Text(
                      "0",
                    style: textTheme.titleSmall,
                  ),
                  left: mediaSize.width * (2/3) * (1/2) - 8,
                ),
                Positioned(
                  child: Text(
                      "6",
                    style: textTheme.titleSmall,
                  ),
                  left: mediaSize.width * (2/3) * 0.9 - 16,
                  top: 100,
                ),
                Positioned(
                  child: Text(
                      "12",
                    style: textTheme.titleSmall,
                  ),
                  left: mediaSize.width * (2/3) * (1/2) - 12,
                  top: 185,
                ),
                Positioned(
                  child: Text(
                      "18",
                    style: textTheme.titleSmall,
                  ),
                  left: 12,
                  top: 100,
                ),
              ],
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
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: ListView.builder(
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
      ),
    );
  }
}

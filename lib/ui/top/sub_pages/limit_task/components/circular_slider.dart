import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class CircularSlider extends StatelessWidget {
  const CircularSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SleekCircularSlider(
      min: 0,
      max: 1000,
      initialValue: 1000,
      appearance: CircularSliderAppearance(
        size: 200,
        startAngle: 0,
        angleRange: 360,
        customWidths: CustomSliderWidths(
          progressBarWidth: 16,
        ),
        customColors: CustomSliderColors(
          trackColor: Theme.of(context).primaryColor,
          progressBarColor: Theme.of(context).primaryColor,
          shadowColor: HexColor("EAAEC5")
        ),
        infoProperties: InfoProperties(
          mainLabelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
            bottomLabelText: "残り時間",
            bottomLabelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
            modifier: percentageModifier
        ),
      ),
      onChange: (double value) {
        // callback providing a value while its being changed (with a pan gesture)
      },
      onChangeStart: (double startValue) {
        // callback providing a starting value (when a pan gesture starts)
      },
      onChangeEnd: (double endValue) {
        // ucallback providing an ending value (when a pan gesture ends)
      },
    );
  }
}

String percentageModifier(double val) {
  final value = val.toInt();
  final hour = value ~/ 3600;
  final minute = (value - (hour * 3600)) ~/ 60;
  final second = value - (hour * 3600) - (minute * 60);
  return "${hour.toString().padLeft(2, "0")}:${minute.toString().padLeft(2, "0")}:${second.toString().padLeft(2, "0")}";
}

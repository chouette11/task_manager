import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomSlider extends ConsumerStatefulWidget {
  const CustomSlider({Key? key}) : super(key: key);

  @override
  _CustomSliderState createState() => _CustomSliderState();
}

class _CustomSliderState extends ConsumerState<CustomSlider> {
  double _currentSliderValue = 0.5;
  @override
  Widget build(BuildContext context) {
    return Slider(
      value: _currentSliderValue,
      max: 4,
      divisions: 8,
      label: "${_currentSliderValue.toString()}" + "時間",
      onChanged: (double value) {
        setState(() {
          _currentSliderValue = value;
        });
      },
    );
  }
}

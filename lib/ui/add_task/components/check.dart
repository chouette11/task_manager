import 'package:flutter/material.dart';

class Check extends StatelessWidget {
  const Check({Key? key, required this.value, required this.onChanged}) : super(key: key);
  final bool value;
  final void Function(bool?) onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("期日を設定しない"),
        Checkbox(
          value: value,
          onChanged: onChanged,
        ),
      ],
    );
  }
}

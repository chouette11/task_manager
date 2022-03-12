import 'package:flutter/material.dart';

class CalendarButton extends StatelessWidget {
  const CalendarButton({Key? key, required this.onPressed}) : super(key: key);
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: onPressed,
        icon: Icon(Icons.calendar_today_rounded),
    );
  }
}

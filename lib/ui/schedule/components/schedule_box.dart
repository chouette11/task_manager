import 'package:flutter/material.dart';

class ScheduleOddBox extends StatelessWidget {
  const ScheduleOddBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 32,
          width: 48,
          child: Text("12:00"),
        ),
        Column(
          children: [
            SizedBox(height: 16),
            Container(
              height: 32,
              width: MediaQuery.of(context).size.width - 72,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: Colors.black, width: 1),
                  bottom: BorderSide(color: Colors.grey, width: 0.5),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}

class ScheduleEvenBox extends StatelessWidget {
  const ScheduleEvenBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 16,
          width: 48,
        ),
        Container(
          height: 16,
          width: MediaQuery.of(context).size.width - 72,
        ),
      ],
    );
  }
}

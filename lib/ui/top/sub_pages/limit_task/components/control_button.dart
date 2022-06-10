import 'package:flutter/material.dart';

class ControlButtons extends StatelessWidget {
  ControlButtons(this.isStart);
  final bool isStart;

  @override
  Widget build(BuildContext context) {
    final mainColor = Theme.of(context).primaryColor;
    final subColor = Colors.white;

    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Container(
          height: 120,
          width: 120,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.15),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3)
              )
            ]
          ),
        ),

        Positioned(
          child: Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.black12, width: 1),
            ),
          ),
        ),

        if (isStart == false)
          Column(
            children: [
              Icon(Icons.power_settings_new, color: mainColor),
              Text("Start", style: TextStyle(color: mainColor),)
            ],
          )
        else
          Container(
            margin: EdgeInsets.all(8.0),
            width: 64.0,
            height: 64.0,
            child: CircularProgressIndicator(),
          ),
      ],
    );
  }
}
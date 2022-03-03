import 'package:flutter/material.dart';

class AddDateButton extends StatelessWidget {
  const AddDateButton({Key? key, required this.title, required this.onPressed}) : super(key: key);
  final String title;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(title),
    );
  }
}

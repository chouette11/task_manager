import 'package:flutter/material.dart';
import 'package:task_manager/ui/components/form/text_field.dart';

class DateTextBox extends StatelessWidget {
  const DateTextBox({
    Key? key,
    required this.hintText,
    required this.initialValue,
    required this.onChanged,
    this.buttons
  }) : super(key: key);
  final String hintText;
  final String initialValue;
  final Function(String) onChanged;
  final List<Widget>? buttons;

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        SizedBox(
          height: 40,
          width: 80,
          child: CustomTextFormField(
            hintText: hintText,
            initialValue: initialValue,
            onChanged: onChanged,
            keyboardType: TextInputType.number,
          ),
        ),

        Text(hintText),

      ],
    );
  }
}

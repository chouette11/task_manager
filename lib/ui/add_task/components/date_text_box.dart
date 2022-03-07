import 'package:flutter/material.dart';
import 'package:task_manager/ui/components/form/text_field.dart';

class DateTextBox extends StatelessWidget {
  const DateTextBox({
    Key? key,
    required this.hintText,
    this.initialValue,
    this.controller,
    this.onChanged,
    this.buttons,
  }) : super(key: key);
  final String hintText;
  final String? initialValue;
  final TextEditingController? controller;
  final Function(String)? onChanged;
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
            controller: controller,
            onChanged: onChanged,
            keyboardType: TextInputType.number,
          ),
        ),

        SizedBox(width: 4),

        Text(
          hintText,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),

        SizedBox(width: 8),

        buttons != null ?
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: buttons!,
          ),
        ) : Container(),
      ],
    );
  }
}

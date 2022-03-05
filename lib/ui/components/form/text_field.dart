import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// テキスト入力欄
class CustomTextFormField extends ConsumerWidget {
  const CustomTextFormField({
    Key? key,
    this.initialValue,
    this.validator,
    this.onChanged,
    this.hintText,
    this.controller,
    this.labelText,
    this.obscureText = false,
    this.keyboardType,
  }) : super(key: key);
  final String? initialValue;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final bool obscureText;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return TextFormField(
      initialValue: initialValue,
      validator: validator,
      onChanged: onChanged,
      controller: controller,
      keyboardType: keyboardType,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.0),
        ),
        hintText: hintText,
        labelText: labelText,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../utils/apps_colors.dart';

class TextFromFiledWidget extends StatelessWidget {
  const TextFromFiledWidget({
    Key? key,
    this.hintText,
    this.maxLines,
    this.controller,
    this.validator,
  }) : super(key: key);

  final String? hintText;
  final int? maxLines;
  final TextEditingController? controller;
  final Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      validator: (value) {
        if (validator != null) {
          return validator!(value);
        }
        return null;
      },
      decoration: InputDecoration(
        border: const OutlineInputBorder(
            borderSide: BorderSide(color: primaryColor)),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: primaryColor)),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: primaryColor),
        ),
        hintText: hintText,
      ),
    );
  }
}

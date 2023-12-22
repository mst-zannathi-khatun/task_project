import 'package:flutter/material.dart';
import '../ui/utils/apps_colors.dart';

class TextFromFiledWidget extends StatelessWidget {
  const TextFromFiledWidget({
    Key? key,  this.hintText,  this.maxLines,
  }) : super(key: key);

  final String? hintText;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      decoration: InputDecoration(
          border: const OutlineInputBorder(
              borderSide: BorderSide(color: primaryColor)
          ),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: primaryColor)
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: primaryColor),
          ),
        hintText: hintText,
      ),
    );
  }
}

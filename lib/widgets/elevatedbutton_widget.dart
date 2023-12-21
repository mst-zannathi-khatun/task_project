import 'package:flutter/material.dart';
import '../ui/utils/apps_colors.dart';

class ElevatedButtonWidget extends StatelessWidget {
  const ElevatedButtonWidget({
    Key? key,
    this.onPressed, // Make onPressed nullable
  }) : super(key: key);

  final VoidCallback? onPressed; // Make onPressed nullable

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(backgroundColor: primaryColor),
        child: const Icon(Icons.arrow_circle_right_outlined, color: Colors.white, size: 24,),
      ),
    );
  }
}

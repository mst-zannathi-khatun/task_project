import 'package:flutter/material.dart';
import '../ui/utils/apps_colors.dart';

class ElevatedButtonWidget extends StatelessWidget {
  const ElevatedButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: (){},
        style: ElevatedButton.styleFrom(backgroundColor: primaryColor),
        child: const Icon(Icons.arrow_circle_right_outlined, color: Colors.white, size: 24,),
      ),
    );
  }
}

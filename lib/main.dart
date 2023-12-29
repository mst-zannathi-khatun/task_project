import 'package:flutter/material.dart';
import 'package:task_project/ui/screen/auth/splashscreen.dart';

void main() {
  runApp(const TaskProject());
}

class TaskProject extends StatelessWidget {
  const TaskProject({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

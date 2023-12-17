import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_project/ui/screen/emailverification_screen.dart';
import 'package:task_project/ui/screen/login_screen.dart';

void main(){
  runApp(const TaskProject());
}

class TaskProject extends StatelessWidget {
  const TaskProject({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: EmailVerificationScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

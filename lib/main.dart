import 'package:flutter/material.dart';
import 'package:task_project/ui/screen/auth/splashscreen.dart';

void main() {
  runApp(const TaskProject());
}

class TaskProject extends StatefulWidget {
  const TaskProject({Key? key}) : super(key: key);
  static GlobalKey<NavigatorState> globalKey = GlobalKey<NavigatorState>();
  @override
  State<TaskProject> createState() => _TaskProjectState();
}

class _TaskProjectState extends State<TaskProject> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: TaskProject.globalKey,
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

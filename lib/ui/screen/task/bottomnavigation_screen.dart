import 'package:flutter/material.dart';
import 'package:task_project/ui/screen/task/progresstask_screen.dart';
import 'package:task_project/ui/utils/apps_colors.dart';
import 'appbar_screen.dart';
import 'cancelledtask_screen.dart';
import 'completedtask_screen.dart';
import 'newtask_screen.dart';


class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key});

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int selectedIndex = 0;

  final List<Widget> screens = [
    const CancelledTaskScreen(),
    const CompletedTaskScreen(),
    const NewTaskScreen(),
    const ProgressTaskScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TaskAppBar(),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: greyColor,
        selectedItemColor: primaryColor,
        showUnselectedLabels: true,
        showSelectedLabels: true,
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        currentIndex: selectedIndex,
        elevation: 4,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.new_label_outlined), label: "New Task"),
          BottomNavigationBarItem(
              icon: Icon(Icons.cabin_sharp), label: "Completed"),
          BottomNavigationBarItem(icon: Icon(Icons.cancel), label: "Canceled"),
          BottomNavigationBarItem(
              icon: Icon(Icons.incomplete_circle), label: "Progress"),
        ],
      ),
    );
  }
}

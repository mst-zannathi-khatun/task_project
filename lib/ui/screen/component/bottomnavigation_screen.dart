import 'package:flutter/material.dart';
import 'package:task_project/ui/screen/task/progresstask_screen.dart';
import 'package:task_project/ui/utils/apps_colors.dart';
import 'appbar_screen.dart';
import '../task/cancelledtask_screen.dart';
import '../task/completedtask_screen.dart';
import '../task/createtask_screen.dart';
import '../task/newtask_screen.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key});

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int selectedIndex = 0;
  final List<Widget> screens = [
    const NewTaskScreen(),
    const CompletedTaskScreen(),
    const CancelledTaskScreen(),
    const ProgressTaskScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: taskAppBar(context),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: primaryColor,
        unselectedItemColor: greyColor,
        selectedItemColor: Colors.white,
        showUnselectedLabels: true,
        showSelectedLabels: true,
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        currentIndex: selectedIndex,
        elevation: 4,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.new_label_outlined), label: "New Task"),
          BottomNavigationBarItem(
              icon: Icon(Icons.cabin_sharp), label: "Completed"),
          BottomNavigationBarItem(icon: Icon(Icons.cancel), label: "Canceled"),
          BottomNavigationBarItem(
              icon: Icon(Icons.incomplete_circle), label: "Progress"),
        ],
      ),
      body: screens[selectedIndex],
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const CreateTaskScreen()));
        },
      ),
    );
  }
}

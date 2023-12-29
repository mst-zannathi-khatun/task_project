import 'package:flutter/material.dart';
import '../../widgets/cardlistview_widget.dart';

class CompletedTaskScreen extends StatefulWidget {
  const CompletedTaskScreen({super.key});
  @override
  State<CompletedTaskScreen> createState() => _CompletedTaskScreenState();
}

class _CompletedTaskScreenState extends State<CompletedTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(4),
        child: SingleChildScrollView(
          child: Column(
            children: const [
              CardListViewWidget(),
              SizedBox(height: 8,),
              CardListViewWidget(),
              SizedBox(height: 8,),
            ],
          ),
        ),
      ),
    );
  }
}


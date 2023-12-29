import 'package:flutter/material.dart';
import '../../widgets/cardlistview_widget.dart';

class ProgressTaskScreen extends StatefulWidget {
  const ProgressTaskScreen({super.key});
  @override
  State<ProgressTaskScreen> createState() => _ProgressTaskScreenState();
}

class _ProgressTaskScreenState extends State<ProgressTaskScreen> {
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

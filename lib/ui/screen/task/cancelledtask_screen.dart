import 'package:flutter/material.dart';

import '../../../widgets/cardlistview_widget.dart';

class CancelledTaskScreen extends StatefulWidget {
  const CancelledTaskScreen({super.key});
  @override
  State<CancelledTaskScreen> createState() => _CancelledTaskScreenState();
}

class _CancelledTaskScreenState extends State<CancelledTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(4),
        child: Column(
          children: const [
            CardListViewWidget(),
            SizedBox(height: 8,),
            CardListViewWidget(),
            SizedBox(height: 8,),
          ],
        ),
      ),
    );
  }
}

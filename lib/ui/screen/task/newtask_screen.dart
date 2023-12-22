import 'package:flutter/material.dart';

import '../../../widgets/cardlistview_widget.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});
  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(4),
        child: Column(
          children: [
            SizedBox(
              height: 60,
              width: double.infinity,
              child: Row(
                children: [
                  TopCardWidget(),
                  SizedBox(width: 8,),
                  TopCardWidget(),
                  SizedBox(width: 8,),
                  TopCardWidget(),
                ],
              ),
            ),
            SizedBox(height: 8,),
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

class TopCardWidget extends StatelessWidget {
  const TopCardWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("09"),
            Text("Completed"),
          ],
        ),
      ),
    );
  }
}

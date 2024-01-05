import 'package:flutter/material.dart';

class TopCardWidget extends StatelessWidget {
  const TopCardWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Card(
      elevation: 4,
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(child: Text("09")),
            Expanded(child: Text("Completed")),
          ],
        ),
      ),
    );
  }
}

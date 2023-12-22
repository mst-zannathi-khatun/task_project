import 'package:flutter/material.dart';
import '../../utils/text_style.dart';
import '../../widgets/elevatedbutton_widget.dart';
import '../../widgets/textfromfiled_widget.dart';
import '../component/bottomnavigation_screen.dart';

class CreateTaskScreen extends StatefulWidget {
  const CreateTaskScreen({super.key});

  @override
  State<CreateTaskScreen> createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends State<CreateTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Create Your Task", style: head1TextStyle,),
            const SizedBox(height: 8,),
            const TextFromFiledWidget(hintText: 'Title',),
            const SizedBox(height: 8,),
            const TextFromFiledWidget(
              hintText: 'Descriptions',
              maxLines: 5,
            ),
            const SizedBox(height: 8,),
            ElevatedButtonWidget(
              onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> const BottomNavigationScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }
}

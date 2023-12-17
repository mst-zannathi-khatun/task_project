import 'package:flutter/material.dart';

import '../../../widgets/elevatedbutton_widget.dart';
import '../../../widgets/textfromfiled_widget.dart';
import '../../utils/text_style.dart';

class SingUpScreen extends StatefulWidget {
  const SingUpScreen({super.key});
  @override
  State<SingUpScreen> createState() => _SingUpScreenState();
}

class _SingUpScreenState extends State<SingUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Join With Us", style: head1TextStyle,),
            const SizedBox(height: 8,),
            const TextFromFiledWidget(hintText: 'Email',),
            const SizedBox(height: 8,),
            const TextFromFiledWidget(hintText: 'First Name',),
            const SizedBox(height: 8,),
            const TextFromFiledWidget(hintText: 'Last Name',),
            const SizedBox(height: 8,),
            const TextFromFiledWidget(hintText: 'Mobile',),
            const SizedBox(height: 8,),
            const TextFromFiledWidget(hintText: 'Password',),
            const SizedBox(height: 8,),
            const ElevatedButtonWidget(),
            const SizedBox(height: 5,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Have Account?"),
                TextButton(onPressed: (){}, child: const Text("Sing In"))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
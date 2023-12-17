import 'package:flutter/material.dart';

import '../../widgets/elevatedbutton_widget.dart';
import '../../widgets/textfromfiled_widget.dart';
import '../utils/text_style.dart';

class SetPasswordScreen extends StatefulWidget {
  const SetPasswordScreen({super.key});
  @override
  State<SetPasswordScreen> createState() => _SetPasswordScreenState();
}

class _SetPasswordScreenState extends State<SetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Set Password Screen", style: head1TextStyle,),
            const SizedBox(height: 2,),
            const Text("Minimun 6 digit passwords"),
            const SizedBox(height: 8,),
            const TextFromFiledWidget(hintText: 'Password',),
            const SizedBox(height: 8,),
            const TextFromFiledWidget(hintText: 'CPassword',),
            const SizedBox(height: 8,),
            const ElevatedButtonWidget(),
            const SizedBox(height: 2,),
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

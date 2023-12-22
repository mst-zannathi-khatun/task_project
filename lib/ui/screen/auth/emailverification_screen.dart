import 'package:flutter/material.dart';
import 'package:task_project/ui/screen/auth/login_screen.dart';
import '../../utils/text_style.dart';
import '../../widgets/elevatedbutton_widget.dart';
import '../../widgets/textfromfiled_widget.dart';
import 'otpverification_screen.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});
  @override
  State<EmailVerificationScreen> createState() => _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Your Email Address", style: head1TextStyle,),
            const SizedBox(height: 2,),
            const Text("A 6 digit verification pin will send to your email address"),
            const SizedBox(height: 8,),
            const TextFromFiledWidget(hintText: 'Email Address',),
            const SizedBox(height: 8,),
             ElevatedButtonWidget(
               onPressed: (){
                 Navigator.push(context, MaterialPageRoute(builder: (context)=> const OTPVerificationScreen()));
               },
             ),
            const SizedBox(height: 2,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Have Account?"),
                TextButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> const LogInScreen()));
                }, child: const Text("Sing In"))
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:task_project/ui/screen/auth/setpassword_screen.dart';
import 'package:task_project/ui/screen/auth/singup_screen.dart';
import 'package:task_project/ui/utils/text_style.dart';
import '../../widgets/elevatedbutton_widget.dart';
import '../../widgets/textfromfiled_widget.dart';
import 'emailverification_screen.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Get Started With", style: head1TextStyle,),
            const SizedBox(height: 8,),
            const TextFromFiledWidget(hintText: 'Email',),
            const SizedBox(height: 8,),
            const TextFromFiledWidget(hintText: 'Password',),
            const SizedBox(height: 8,),
            ElevatedButtonWidget(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const EmailVerificationScreen()));
              },
            ),
            const SizedBox(height: 32,),
            TextButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> const SetPasswordScreen()));
            }, child: const Text("Forget Password?")),
            const SizedBox(height: 2,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't Have Account?"),
                TextButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> const SingUpScreen()));
                }, child: const Text("Sing Up"))
              ],
            ),
          ],
        ),
      ),
    );
  }
}



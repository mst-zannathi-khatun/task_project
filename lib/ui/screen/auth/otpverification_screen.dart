import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:task_project/ui/screen/auth/setpassword_screen.dart';
import '../../utils/text_style.dart';
import '../../widgets/elevatedbutton_widget.dart';

class OTPVerificationScreen extends StatefulWidget {
  const OTPVerificationScreen({super.key});

  @override
  State<OTPVerificationScreen> createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Pin Verification", style: head1TextStyle,),
            const SizedBox(height: 2,),
            const Text("A 6 digit verification pin will send to your email address"),
            const SizedBox(height: 8,),
            OTPTextField(
              length: 6,
              width: MediaQuery.of(context).size.width,
              fieldWidth: 60,
              style: const TextStyle(
                  fontSize: 17
              ),
              textFieldAlignment: MainAxisAlignment.spaceAround,
              fieldStyle: FieldStyle.underline,
              onCompleted: (pin) {
                print("Completed: " + pin);
              },
            ),
            const SizedBox(height: 8,),
            ElevatedButtonWidget(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const SetPasswordScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }
}

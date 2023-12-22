import 'package:flutter/material.dart';
import 'package:task_project/ui/screen/auth/login_screen.dart';

import '../../../widgets/elevatedbutton_widget.dart';
import '../../../widgets/textfromfiled_widget.dart';
import '../../utils/text_style.dart';

class ProfileUpdateScreen extends StatefulWidget {
  const ProfileUpdateScreen({super.key});

  @override
  State<ProfileUpdateScreen> createState() => _ProfileUpdateScreenState();
}

class _ProfileUpdateScreenState extends State<ProfileUpdateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Update Your Profile", style: head1TextStyle,),
            const SizedBox(height: 8,),
            const TextFromFiledWidget(hintText: 'Photo',),
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
             ElevatedButtonWidget(
               onPressed: (){
                 Navigator.push(context, MaterialPageRoute(builder: (context)=> const LogInScreen()));
               },
             ),
          ],
        ),
      ),
    );
  }
}

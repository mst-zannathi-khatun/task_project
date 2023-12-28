import 'package:flutter/material.dart';
import 'package:task_project/ui/screen/auth/setpassword_screen.dart';
import 'package:task_project/ui/screen/auth/singup_screen.dart';
import 'package:task_project/ui/utils/text_style.dart';
import '../../widgets/elevatedbutton_widget.dart';
import '../../widgets/textfromfiled_widget.dart';


class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  TextEditingController _emailETController = TextEditingController();
  TextEditingController _passwordETController = TextEditingController();
  final GlobalKey<FormState> _fromKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: _fromKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Get Started With",
                style: head1TextStyle,
              ),
              const SizedBox(
                height: 8,
              ),
              TextFromFiledWidget(
                hintText: 'Email',
                controller: _emailETController,
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return "Enter Your Email";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 8,
              ),
              TextFromFiledWidget(
                hintText: 'Password',
                controller: _passwordETController,
                validator: (value) {
                  if ((value?.isEmpty ?? true) && ((value?.length ?? 0) < 6)) {
                    return "Enter Your Password";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 8,
              ),
              ElevatedButtonWidget(
                onPressed: () async {

                },
              ),
              const SizedBox(
                height: 32,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SetPasswordScreen()));
                  },
                  child: const Text("Forget Password?")),
              const SizedBox(
                height: 2,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't Have Account?"),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SingUpScreen()));
                      },
                      child: const Text("Sing Up"))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

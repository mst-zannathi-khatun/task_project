import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_project/api/httpnetwork.dart';
import 'package:task_project/api/urls.dart';
import 'package:task_project/ui/screen/auth/setpassword_screen.dart';
import 'package:task_project/ui/screen/auth/singup_screen.dart';
import 'package:task_project/ui/utils/text_style.dart';
import '../../widgets/elevatedbutton_widget.dart';
import '../../widgets/textfromfiled_widget.dart';
import '../component/bottomnavigation_screen.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final TextEditingController _emailETController = TextEditingController();
  final TextEditingController _passwordETController = TextEditingController();

  final GlobalKey<FormState> _fromKey = GlobalKey<FormState>();
  bool _inProgress = false;

  Future<void> login() async {
    _inProgress = true;
    setState(() {});
    final result = await HTTPNetWorkUtils().postMethod(Urls.Login, body: {
      "email": _emailETController.text.trim(),
      "password": _passwordETController.text,
    }, onUnAuthorized: () {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("User Name Password Failed")));
    });
    _inProgress = false;
    setState(() {});
    print(result);
    if (result != null && result['status'] == 'success') {
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      await sharedPreferences.setString('token', result['token']);
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (context) => const BottomNavigationScreen()),
          (route) => false);
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Registration Faile")));
    }
  }

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
              if (_inProgress)
                const Center(
                  child: CircularProgressIndicator(
                    color: Colors.green,
                  ),
                )
              else
                ElevatedButtonWidget(
                  onPressed: () async {
                    if (_fromKey.currentState!.validate()) {}
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

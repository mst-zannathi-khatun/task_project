import 'package:flutter/material.dart';
import 'package:task_project/api/httpnetwork.dart';
import '../../utils/text_style.dart';
import '../../widgets/elevatedbutton_widget.dart';
import '../../widgets/textfromfiled_widget.dart';

class SingUpScreen extends StatefulWidget {
  const SingUpScreen({super.key});

  @override
  State<SingUpScreen> createState() => _SingUpScreenState();
}

class _SingUpScreenState extends State<SingUpScreen> {
  final TextEditingController emailETController = TextEditingController();
  final TextEditingController firstNameETController = TextEditingController();
  final TextEditingController lastNameETController = TextEditingController();
  final TextEditingController mobileETController = TextEditingController();
  final TextEditingController passwordETController = TextEditingController();

  final GlobalKey<FormState> _fromKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: _fromKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Join With Us",
                  style: head1TextStyle,
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFromFiledWidget(
                  hintText: 'Email',
                  controller: emailETController,
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
                  hintText: 'First Name',
                  controller: firstNameETController,
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return "Enter Your First Name";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFromFiledWidget(
                  hintText: 'Last Name',
                  controller: lastNameETController,
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return "Enter Your Last Name";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFromFiledWidget(
                  hintText: 'Mobile',
                  controller: mobileETController,
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return "Enter Your Mobile";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFromFiledWidget(
                  hintText: 'Password',
                  controller: passwordETController,
                  validator: (value) {
                    if ((value?.isEmpty ?? true) &&
                        ((value?.length ?? 0) < 6)) {
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
                    if (_fromKey.currentState!.validate()) {
                      final result = await NetworkUtils().postMethod(
                        "https://task.teamrabbil.com/api/v1/registration",
                        body: {
                          'email': emailETController.text.trim(),
                          'firstName': mobileETController.text.trim(),
                          'lastName': passwordETController.text.trim(),
                          'mobile': firstNameETController.text.trim(),
                          'password': lastNameETController.text,
                        }
                        );

                      print(result);

                      if (result != null && result['status'] == 'success') {
                        emailETController.clear();
                        mobileETController.clear();
                        passwordETController.clear();
                        firstNameETController.clear();
                        lastNameETController.clear();
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("Registration Succfully")));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Registration Fail")));
                      }
                    }
                  },
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Have Account?"),
                    TextButton(onPressed: () {}, child: const Text("Sing In"))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

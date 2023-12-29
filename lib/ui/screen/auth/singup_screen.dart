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
  bool _inProgress = false;

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
                if (_inProgress)
                  const Center(
                    child: CircularProgressIndicator(
                      color: Colors.green,
                    ),
                  )
                else
                  ElevatedButtonWidget(
                    onPressed: () async {
                      if (_fromKey.currentState!.validate()) {
                        _inProgress = true;
                        setState(() {});
                        final result = await HTTPNetWorkUtils().postMethod(
                            "https://task.teamrabbil.com/api/v1/registration",
                            body: {
                              "email": emailETController.text.trim(),
                              "firstName": firstNameETController.text.trim(),
                              "lastName": lastNameETController.text.trim(),
                              "mobile": mobileETController.text.trim(),
                              "password": passwordETController.text,
                            });
                        print(result);
                        _inProgress = false;
                        setState(() {});
                        if (result != null && result['status'] == 'success') {
                          emailETController.clear();
                          firstNameETController.clear();
                          lastNameETController.clear();
                          mobileETController.clear();
                          passwordETController.clear();
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Registration Success")));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Registration Faile")));
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

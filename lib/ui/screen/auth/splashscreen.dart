import 'dart:async';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:task_project/api/auth_utils.dart';
import 'package:task_project/ui/utils/apps_colors.dart';
import '../component/bottomnavigation_screen.dart';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 4),
      () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const LogInScreen(),
          ),
        );
      },
    );
    checkUserAuthState();
  }

  void checkUserAuthState() async {
    final bool result = await AuthUtils.checkLoginState();
    if (result) {
      await AuthUtils.getAuthData();
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (context) => const BottomNavigationScreen()),
          (route) => false);
    } else {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const LogInScreen()),
          (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 250.0,
        child: TextLiquidFill(
          text: 'WELCOME',
          waveColor: primaryColor,
          boxBackgroundColor: Colors.white,
          textStyle: const TextStyle(
            fontSize: 50.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

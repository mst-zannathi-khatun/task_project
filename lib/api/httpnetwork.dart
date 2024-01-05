import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:task_project/main.dart';
import 'package:task_project/ui/screen/auth/login_screen.dart';
import 'auth_utils.dart';
import 'dart:developer';

class HTTPNetWorkUtils {
  Future<dynamic> getMethod(String url, {VoidCallback? onUnAuthorized}) async {
    try {
      final http.Response response = await http.get(
        Uri.parse(url),
        headers: {
          'Content-type': 'application/json',
          'token': AuthUtils.token ?? ''
        },
      );
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else if (response.statusCode == 401) {
        if (onUnAuthorized != null) {
          onUnAuthorized();
        } else {
          moveToLogin();
        }
      } else {
        log("Something went wrong");
      }
    } catch (e) {
      log(e.toString());
    }
  }

  /// registration and login screen

  Future<dynamic> postMethod(String url,
      {Map<String, String>? body,
      VoidCallback? onUnAuthorized,
      String? token}) async {
    try {
      final http.Response response = await http.post(Uri.parse(url),
          headers: {
            'Content-type': 'application/json',
            'token': AuthUtils.token ?? ''
          },
          body: jsonEncode(body));
      log(response.body);
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else if (response.statusCode == 401) {
        if (onUnAuthorized != null) {
          onUnAuthorized();
        } else {
          moveToLogin();
        }
      } else {
        log("Something Went Wrong");
      }
    } catch (e) {
      log(e.toString());
    }
  }

  void moveToLogin() async {
    await AuthUtils.clearData();
    Navigator.pushAndRemoveUntil(
      TaskProject.globalKey.currentContext!,
      MaterialPageRoute(builder: (context) => const LogInScreen()),
      (route) => false,
    );
  }
}

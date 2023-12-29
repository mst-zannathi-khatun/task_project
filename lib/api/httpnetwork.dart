import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class HTTPNetWorkUtils {
  Future<dynamic> getMethod(String url, {VoidCallback? onUnAuthorized}) async {
    try {
      final http.Response response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else if (response.statusCode == 401) {
        if (onUnAuthorized != null) {
          onUnAuthorized();
        }
      } else {
        print("Something went wrong");
      }
    } catch (e) {
      print(e);
    }
  }

  /// registration and login screen

  Future<dynamic> postMethod(String url,
      {Map<String, String>? body, VoidCallback? onUnAuthorized}) async {
    try {
      final http.Response response = await http.post(Uri.parse(url),
          headers: {
            'Content-type': 'application/json',
          },
          body: jsonEncode(body));
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else if (response.statusCode == 401) {
        if (onUnAuthorized != null) {
          onUnAuthorized();
        }
      } else {
        print("Something Went Wrong");
      }
    } catch (e) {
      print(e);
    }
  }
}

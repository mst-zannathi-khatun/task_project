import 'package:shared_preferences/shared_preferences.dart';

class AuthUtils {
  static String? firstName, lastName, token, profilePic, mobile, email;

  static Future<void> saveUserData(
    String ufirstName,
    String ulastName,
    String utoken,
    String uprofilePic,
    String umobile,
    String uemail,
  ) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    await sharedPreferences.setString('token', utoken);
    await sharedPreferences.setString('firstName', ufirstName);
    await sharedPreferences.setString('lastName', ulastName);
    await sharedPreferences.setString('profilePic', uprofilePic);
    await sharedPreferences.setString('mobile', umobile);
    await sharedPreferences.setString('email', uemail);

    firstName = ufirstName;
    lastName = ulastName;
    token = utoken;
    profilePic = uprofilePic;
    mobile = umobile;
    email = uemail;
  }

  static Future<bool> checkLoginState() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString('token');
    if (token == null) {
      return false;
    } else {
      return true;
    }
  }

  static Future<void> getAuthData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    token = sharedPreferences.getString('token');
    firstName = sharedPreferences.getString('firstName');
    lastName = sharedPreferences.getString('lastName');
    profilePic = sharedPreferences.getString('profilePic');
    mobile = sharedPreferences.getString('mobile');
    email = sharedPreferences.getString('email');
  }

  static Future<void> clearData() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.clear();
  }
}

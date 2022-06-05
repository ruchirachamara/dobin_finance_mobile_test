import 'dart:async';

import 'package:dobin_finance_mobile_test/domain/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  Future<User> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    int userId = prefs.getInt("userId");
    String name = prefs.getString("name");
    String token = prefs.getString("token");
    String renewalToken = prefs.getString("renewalToken");

    return User(
        userId: userId, name: name, token: token, renewalToken: renewalToken);
  }

  Future<String> getToken(args) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token");
    return token;
  }
}

import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'package:dobin_finance_mobile_test/domain/user.dart';
import 'package:dobin_finance_mobile_test/util/app_url.dart';

enum Status {
  NotRegistered,
  Registered,
  Registering,
}

class AuthProvider with ChangeNotifier {
  Status _registeredInStatus = Status.NotRegistered;

  Status get registeredInStatus => _registeredInStatus;

  Future<Map<String, dynamic>> login(String name) async {
    var result;
    final Map<String, dynamic> loginData = {
      'user': {'name': name}
    };

    notifyListeners();

    Response response = await post(
      AppUrl.register,
      body: json.encode(loginData),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      var userData = responseData['data'];
      User authUser = User.fromJson(userData);
      notifyListeners();
      result = {'status': true, 'message': 'Successful', 'user': authUser};
    } else {
      notifyListeners();
      result = {
        'status': false,
        'message': json.decode(response.body)['error']
      };
    }
    return result;
  }

  Future<Map<String, dynamic>> register(String name) async {
    final Map<String, dynamic> registrationData = {
      'user': {
        'name': name,
      }
    };
    return await post(AppUrl.register,
            body: json.encode(registrationData),
            headers: {'Content-Type': 'application/json'})
        .then(onValue)
        .catchError(onError);
  }

  static Future<FutureOr> onValue(Response response) async {
    var result;
    final Map<String, dynamic> responseData = json.decode(response.body);

    print(response.statusCode);
    if (response.statusCode == 200) {
      var userData = responseData['data'];
      User authUser = User.fromJson(userData);
      result = {
        'status': true,
        'message': 'Successfully registered',
        'data': authUser
      };
    } else {
      result = {
        'status': false,
        'message': 'Registration failed',
        'data': responseData
      };
    }
    return result;
  }

  static onError(error) {
    print("the error is $error.detail");
    return {'status': false, 'message': 'Unsuccessful Request', 'data': error};
  }
}

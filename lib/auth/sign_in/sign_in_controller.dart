import 'dart:convert';
import 'package:http/http.dart';
import 'package:task_scheduler/auth/sign_in/sign_in_model.dart';
import 'package:flutter/material.dart';


class SignInProvider extends ChangeNotifier {
  SignInModel _model = SignInModel();

  SignInModel get model => _model;

  Future<void> login() async {
    try {
      Response response = await post(
        Uri.parse('https://dummyjson.com/auth/login'),
        body: {'email': _model.email, 'password': _model.password},
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        print(data['token']);
        print('Login successfully');
      } else {
        print('failed');
      }
    } catch (e) {
      print(e.toString());
    }
  }
}

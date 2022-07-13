import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:mvc_text/models/login_model.dart';
import 'package:mvc_text/services/network_handler/network_handler.dart';

class LoginController extends GetxController{

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void login() async{
    LoginModel loginModel = LoginModel(email: emailController.text, password: passwordController.text);

    var response = await NetworkHandler.post(loginModelToJson(loginModel), "login?accountType=1");
    print(response);
  }

}
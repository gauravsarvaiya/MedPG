import 'package:flutter/material.dart';
import '../view/login_screen.dart';
import '../view/register_screen.dart';

class AuthRoute{
  static String loginRoute = "/login";
  static String registerRoute = "/register";

  static Widget get loginChild => const LoginScreen();
  static Widget get registerChild => const RegisterScreen();

  static goToLoginPage(BuildContext context) {
    Navigator.of(context).pushNamed(loginRoute);
  }

  static goToRegisterPage(BuildContext context) {
    Navigator.of(context).pushNamed(registerRoute);
  }
}
import 'package:flutter/material.dart';
import 'package:medpg/app/leading/view/leading_screen.dart';


class LendingRoute{
  static String route = "/";

  static Widget get child => const LeadingScreen();

  static goToLoginPage(BuildContext context) {
    Navigator.of(context).pushNamed(route);
  }
}
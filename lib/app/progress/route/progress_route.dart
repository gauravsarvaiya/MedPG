import 'package:flutter/material.dart';
import 'package:medpg/app/progress/view/progress_screen.dart';

class ProgressRoute{
  static String route = "/mocksScreen";

  static Widget get child => const ProgressScreen();

  static goToProgressPage(BuildContext context) {
    Navigator.of(context).pushNamed(route);
  }
}
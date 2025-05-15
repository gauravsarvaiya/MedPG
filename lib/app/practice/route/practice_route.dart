import 'package:flutter/material.dart';
import 'package:medpg/app/practice/view/practice_screen.dart';

class PracticeRoute{
  static String route = "/practiceScreen";

  static Widget get child => const PracticeScreen();

  static goToPracticePage(BuildContext context) {
    Navigator.of(context).pushNamed(route);
  }
}
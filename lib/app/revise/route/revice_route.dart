import 'package:flutter/material.dart';
import 'package:medpg/app/revise/view/revise_screen.dart';

class ReviceRoute{
  static String route = "/revice";

  static Widget get child => const ReviseScreen();

  static goToProgressPage(BuildContext context) {
    Navigator.of(context).pushNamed(route);
  }
}
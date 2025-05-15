import 'package:flutter/material.dart';
import 'package:medpg/app/bottom_nav/view/bottom_nav_screen.dart';


class BottomRoute{
  static String route = "/bottomNav";

  static Widget get bottomNavChild => const BottomNavScreen();

  static goToMocksPage(BuildContext context) {
    Navigator.of(context).pushNamed(route);
  }
}
import 'package:flutter/material.dart';
import 'package:medpg/app/home/view/home_screen.dart';
import 'package:medpg/app/home/view/notification_screen.dart';
import 'package:medpg/app/home/view/profile_screen.dart';

class HomeRoute{
  static String route = "/home";
  static String notificationRoute = "/notification";
  static String profilerRoute = "/profile";

  static Widget get homeChild => const HomeScreen();
  static Widget get notificationChild => const NotificationScreen();
  static Widget get profileChild => const ProfileScreen();

  static goToHomePage(BuildContext context) {
    Navigator.of(context).pushNamed(route);
  }

  static goToNotificationPage(BuildContext context) {
    Navigator.of(context).pushNamed(notificationRoute);
  }

  static goToProfilePage(BuildContext context) {
    Navigator.of(context).pushNamed(profilerRoute);
  }
}
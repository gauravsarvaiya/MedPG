import 'package:flutter/cupertino.dart';
import 'package:medpg/app/mocks/view/mocks_screen.dart';

class MocksRoute{
  static String route = "/mocksScreen";

  static Widget get mocksChild => const MocksScreen();

  static goToMocksPage(BuildContext context) {
    Navigator.of(context).pushNamed(route);
  }
}
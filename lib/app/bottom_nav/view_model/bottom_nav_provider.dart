import 'package:flutter/material.dart';

class BottomNavProvider extends ChangeNotifier{

  int currentIndex = 0;

  tabChangeIndex({required int index}){
    currentIndex = index;
    notifyListeners();
  }
}
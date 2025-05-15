import 'package:flutter/material.dart';
import 'package:medpg/app/auth/view/login_screen.dart';
import 'package:medpg/app/bottom_nav/view/bottom_nav_screen.dart';
import 'package:provider/provider.dart';

import '../../splash/view/splash_screen.dart';
import '../view_model/leanding_provider.dart';

class LeadingScreen extends StatefulWidget {
  const LeadingScreen({super.key});

  @override
  State<LeadingScreen> createState() => _LeadingScreenState();
}

class _LeadingScreenState extends State<LeadingScreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () async{});
  }

  @override
  Widget build(BuildContext context) {
    final lendingProvider = context.watch<LendingProvider>();
    final appState = lendingProvider.appState;
    print("appState?.isLogin ${appState?.isLogin}");
    print("token ${appState?.token}");

    if(appState?.isLogin == null) {
      return const SplashScreen();
    }else if(appState?.isLogin == true){
      return BottomNavScreen();
    }else{
      return LoginScreen();
    }

  }
}





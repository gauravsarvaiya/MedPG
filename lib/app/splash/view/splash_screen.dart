import 'package:flutter/material.dart';
import 'package:medpg/utils/utils.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    _opacityAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async{
      Future.delayed(const Duration(seconds: 2), () async{});
    },);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff3788d8),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadeTransition(
              opacity: _opacityAnimation,
              child: Container(
                width: MediaQuery.of(context).size.width / 1.8,
                height: MediaQuery.of(context).size.width / 1.8,
                decoration: BoxDecoration(
                  color: kWhiteColor.withValues(alpha: 0.9),
                  borderRadius: BorderRadius.circular(15.sp)
                ),
                child: Image.asset('assets/images/logo_splash.jpg'),
              ),
            ),

            SizedBox(height: 20.sp),

            Text('TheMedico.App',style: CustomTextStyle.boldFont26Style.copyWith(fontSize: 26.sp),),

            SizedBox(height: 20.sp),

            Text('Launching themedico.app...  ',style: CustomTextStyle.boldFont26Style.copyWith(fontSize: 14.sp),),

            SizedBox(height: 20.sp),
          ],
        ),
      ),

    );
  }
}

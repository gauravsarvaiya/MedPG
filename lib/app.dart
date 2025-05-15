import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medpg/utils/services/provider.dart';
import 'package:medpg/utils/utils.dart';
import 'package:provider/provider.dart';
import 'app/leading/route/leading_route.dart';

class MedPgApp extends StatelessWidget {
  const MedPgApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child:MultiProvider(
        providers: [
          AppProviders.shared.authProvider,
          AppProviders.shared.lendingProvider,
          AppProviders.shared.tabProvider,
          AppProviders.shared.homeProvider
        ],
        child: Sizer(
          builder: (context, orientation, deviceType) {
            return  MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'MedPG',
              routes: Routes().routes,
              initialRoute: LendingRoute.route,
              theme: appTheme(context),
              builder: (context, child) {
                final data  = MediaQuery.of(context);
                return MediaQuery(
                    data: data.copyWith(textScaler: const TextScaler.linear(1.0),),
                    child: child ?? const SizedBox.shrink()
                ) ;
              },
            );
          },
        ),
      ),
    );
  }

  ThemeData appTheme(BuildContext context){
    return ThemeData(
        appBarTheme: AppBarTheme.of(context).copyWith(
            centerTitle: true,
            color: Colors.transparent,
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: Brightness.dark,
            ),
            foregroundColor: kBlackColor,
            surfaceTintColor: Colors.transparent,
            toolbarHeight: kToolbarHeight,
            titleTextStyle: TextStyle(
                color: kWhiteColor,
                fontSize: 22.sp,
                fontWeight: FontWeight.w700,
                // fontFamily: "Outfit"
            ),
            shape:  UnderlineInputBorder(
              borderSide: BorderSide(color: kTextSecondaryColor.withOpacity(0.30)),
            )
        ),
        scaffoldBackgroundColor: Colors.blue.shade50,
        primarySwatch: primarySwatchColor,
        useMaterial3: true,
        fontFamily: "Outfit"
    );
  }
}

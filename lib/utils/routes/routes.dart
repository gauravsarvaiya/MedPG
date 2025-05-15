part of utils;

class Routes {
  Map<String, WidgetBuilder> routes = {
    LendingRoute.route:(context) => LendingRoute.child,
    BottomRoute.route:(context) => BottomRoute.bottomNavChild,
    AuthRoute.loginRoute:(context) => AuthRoute.loginChild,
    AuthRoute.registerRoute:(context) => AuthRoute.registerChild,
    HomeRoute.route:(context) => HomeRoute.homeChild,
    HomeRoute.notificationRoute:(context) => HomeRoute.notificationChild,
    HomeRoute.profilerRoute:(context) => HomeRoute.profileChild,
    MocksRoute.route:(context) => MocksRoute.mocksChild,
  };
}
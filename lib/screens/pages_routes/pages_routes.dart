import 'package:get/get.dart';
import 'package:greengrocer/screens/base_screen.dart';
import 'package:greengrocer/screens/cart_tab.dart';
import 'package:greengrocer/screens/product_screen.dart';
import 'package:greengrocer/screens/sign_in_screen.dart';
import 'package:greengrocer/screens/sign_up_screen.dart';
import 'package:greengrocer/screens/splash_screen.dart';

abstract class AppPages {
  static final pages = <GetPage>[
    GetPage(name: PagesRoutes.splashRoute, page: () => SplashScreen()),
    GetPage(name: PagesRoutes.signInRoute, page: () => SignInScreen()),
    GetPage(name: PagesRoutes.signUpRoute, page: () => SignUpScreen()),
    GetPage(name: PagesRoutes.baseRoute, page: () => BaseScreen()),
    GetPage(name: PagesRoutes.cartTabRoute, page: () => CartTab()),
    GetPage(name: PagesRoutes.productRoute, page: () => ProductScreen()),
  ];
}

abstract class PagesRoutes {
  static const String splashRoute = '/splash';
  static const String signInRoute = '/signIn';
  static const String signUpRoute = '/signUp';
  static const String baseRoute = '/base';
  static const String cartTabRoute = '/cartTab';
  static const String productRoute = '/product';
}

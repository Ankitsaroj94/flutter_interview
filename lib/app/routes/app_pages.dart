// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';

import '../modules/collect_user_details/bindings/collect_user_details_binding.dart';
import '../modules/collect_user_details/views/collect_user_details_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/log_in/bindings/log_in_binding.dart';
import '../modules/log_in/views/log_in_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/sign_up/bindings/sign_up_binding.dart';
import '../modules/sign_up/views/sign_up_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SIGN_UP,
      page: () => const SignUpView(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: _Paths.LOG_IN,
      page: () => const LogInView(),
      binding: LogInBinding(),
    ),
    GetPage(
      name: _Paths.COLLECT_USER_DETAILS,
      page: () => const CollectUserDetailsView(),
      binding: CollectUserDetailsBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
  ];
}

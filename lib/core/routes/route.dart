import 'package:go_router/go_router.dart';
import 'package:smoney/features/account/view/account_page.dart';
import 'package:smoney/features/auth/view/login_page.dart';
import 'package:smoney/features/auth/view/register_page.dart';
import 'package:smoney/features/nav/nav_bottom.dart';

class AppRoute {
  static const String home = '/';
  static const String login = '/login';
  static const String register = '/register';
  static const String account = '/account';
}

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: AppRoute.home,
      name: AppRoute.home,
      builder: (context, state) => const NavBottom(),
      routes: [
        GoRoute(
          path: AppRoute.login,
          name: AppRoute.login,
          builder: (context, state) => const LoginPage(),
        ),
        GoRoute(
          path: AppRoute.register,
          name: AppRoute.register,
          builder: (context, state) => const RegisterPage(),
        ),
        GoRoute(
          path: AppRoute.account,
          name: AppRoute.account,
          builder: (context, state) => const AccountPage(),
        ),
      ],
    ),
  ],
);

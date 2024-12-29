import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:smoney/core/common/common.export.dart';
import 'package:smoney/core/routes/route.dart';
import 'package:smoney/features/auth/view/register_page.dart';
import 'package:smoney/features/nav/nav_bottom.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'core/theme/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'features/auth/view/login_page.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Load .env file
  await dotenv.load(fileName: ".env");
  // Initialize Supabase
  await Supabase.initialize(url: supabaseUrl, anonKey: supabaseKey);
  // Initialize Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // Initialize Hive
  await Hive.initFlutter();
  runApp(
    ProviderScope(
      child: const SmoneyApp(),
    ),
  );
}

class SmoneyApp extends ConsumerWidget {
  const SmoneyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: theme,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      routerConfig: _router,
    );
  }
}

final GoRouter _router = GoRouter(
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
      ],
    ),
  ],
);

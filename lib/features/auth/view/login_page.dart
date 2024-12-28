import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:smoney/core/common/common.export.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: FilledButton.icon(
          onPressed: () {},
          icon: Icon(MingCute.google_line),
          label: Text(context.l10n.login),
        ),
      ),
    );
  }
}

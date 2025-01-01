import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smoney/core/common/common.export.dart';
import 'package:smoney/features/auth/provider/auth_provider.dart';

class HomeAppbar extends ConsumerWidget {
  const HomeAppbar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authProvider = ref.watch(authNotifierProvider);
    final user = authProvider.user;
    final title =
        user != null ? '${context.l10n.hi}\n${user.name}' : context.l10n.home;
    return SliverAppBar.medium(
      flexibleSpace: FlexibleSpaceBar(
        title: Text(title),
        titlePadding: EdgeInsets.only(left: Dimens.size12),
        centerTitle: false,
      ),
    );
  }
}

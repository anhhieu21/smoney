import 'package:animate_gradient/animate_gradient.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:smoney/core/common/common.export.dart';
import 'package:smoney/core/routes/route.dart';
import 'package:smoney/features/auth/provider/auth_provider.dart';

class HeaderWidget extends ConsumerWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authNotifierProvider);
    final user = authState.user;
    return SliverToBoxAdapter(
      child: Container(
        margin: EdgeInsets.all(Dimens.size8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimens.size8),
          boxShadow: [
            BoxShadow(
              color: context.colorScheme.secondary.withValues(alpha: 0.3),
              blurRadius: Dimens.size4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(Dimens.size8),
          child: AnimateGradient(
            textDirectionForGeometry: TextDirection.rtl,
            primaryColors: [
              context.colorScheme.primaryContainer,
              context.colorScheme.primaryFixedDim,
            ],
            secondaryColors: [
              context.colorScheme.secondaryContainer,
              context.colorScheme.secondary,
            ],
            child: ListTile(
              onTap: () => context.pushNamed(
                  authState.authStatus == AuthStatus.authenticated
                      ? AppRoute.account
                      : AppRoute.login),
              title: Text(user?.email ?? context.l10n.login),
              titleTextStyle: context.textTheme.titleLarge,
              subtitle: Text(context.l10n.moreSubtitle),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:smoney/core/common/common.export.dart';
import 'package:smoney/features/auth/provider/auth_provider.dart';
import 'package:smoney/features/more/view/widgets/wrap_menu_item.dart';

enum AccountMenuEnum {
  backup,
  restore,
  removeAccount,
  logout,
}

extension AccountMenuEnumExtension on AccountMenuEnum {
  IconData get icon {
    switch (this) {
      case AccountMenuEnum.backup:
        return MingCute.upload_3_fill;
      case AccountMenuEnum.restore:
        return MingCute.download_3_fill;
      case AccountMenuEnum.removeAccount:
        return MingCute.delete_3_fill;
      case AccountMenuEnum.logout:
        return MingCute.exit_fill;
    }
  }

  String getTitle(BuildContext context) {
    switch (this) {
      case AccountMenuEnum.backup:
        return context.l10n.backup;
      case AccountMenuEnum.restore:
        return context.l10n.restore;
      case AccountMenuEnum.removeAccount:
        return context.l10n.removeAccount;
      case AccountMenuEnum.logout:
        return context.l10n.logout;
    }
  }
}

class AccountMenu extends ConsumerWidget {
  const AccountMenu({super.key});

  _handleOnTap(BuildContext context, AccountMenuEnum item, WidgetRef ref) {
    switch (item) {
      case AccountMenuEnum.backup:
        break;
      case AccountMenuEnum.restore:
        break;
      case AccountMenuEnum.removeAccount:
        break;
      case AccountMenuEnum.logout:
        ref.read(authNotifierProvider.notifier).signOut().whenComplete(() {
          if (context.mounted) {
            context.pop();
          }
        });
        break;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(Dimens.size8),
      child: Column(
        spacing: Dimens.size8,
        children: AccountMenuEnum.values.map((item) {
          return WrapMenuItem<AccountMenuEnum>(
            item: item,
            onTap: () => _handleOnTap(context, item, ref),
            leading: Icon(item.icon),
            title: item.getTitle(context),
          );
        }).toList(),
      ),
    );
  }
}

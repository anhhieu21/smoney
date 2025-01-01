import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smoney/core/common/common.export.dart';
import 'package:smoney/features/account/view/widgets/account_menu.dart';
import 'package:smoney/features/auth/provider/auth_provider.dart';

class AccountPage extends ConsumerWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authNotifierProvider);
    final user = authState.user!;
    final avatar = user.userMetadata?['avatar_url'];
    final name = user.userMetadata?['name'];
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              radius: Dimens.size32,
              backgroundImage: NetworkImage(avatar ?? ''),
            ),
            horizontalTitleGap: Dimens.size4,
            title: Text(name),
            subtitle: Text(user.email ?? ""),
          ),
          AccountMenu(),
        ],
      ),
    );
  }
}

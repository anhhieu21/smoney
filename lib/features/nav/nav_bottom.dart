import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smoney/core/common/enum_constant.dart';
import 'package:smoney/features/budget/view/budget_page.dart';
import 'package:smoney/features/home/view/home_page.dart';
import 'package:smoney/features/more/view/more_page.dart';
import 'package:smoney/features/nav/provider/nav_provider.dart';
import 'package:smoney/features/transaction/view/transaction_page.dart';

class NavBottom extends ConsumerWidget {
  const NavBottom({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(navNotifierProvider);
    return Scaffold(
      body: IndexedStack(
        index: index,
        children: [
          HomePage(),
          TransactionPage(),
          BudgetPage(),
          MorePage(),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: index,
        onDestinationSelected:
            ref.read(navNotifierProvider.notifier).changeIndex,
        destinations: NavBottomEnum.values
            .map((e) => NavigationDestination(
                  icon: Icon(e.icon),
                  selectedIcon: Icon(e.selectIcon(context)),
                  label: e.getTitle(context),
                ))
            .toList(),
      ),
    );
  }
}

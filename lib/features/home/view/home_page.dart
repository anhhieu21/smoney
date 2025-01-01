import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smoney/core/common/common.export.dart';
import 'package:smoney/features/home/view/widgets/graph_transaction_widget.dart';
import 'package:smoney/features/home/view/widgets/transaction_widget.dart';
import 'package:smoney/features/home/view/widgets/wallet_widget.dart';
import 'package:smoney/features/transaction/view/add_transaction_page.dart';
import 'package:smoney/features/home/view/widgets/home_appbar.dart';
import 'package:animations/animations.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          HomeAppbar(),
          WalletWidget(),
          TransactionWidget(),
          GraphTransactionWidget(),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return ListTile(
                  title: Text('Item $index'),
                );
              },
              childCount: 100,
            ),
          ),
        ],
      ),
      floatingActionButton: OpenContainer(
        openColor: context.theme.cardColor,
        openBuilder: (context, closedContainer) => AddTransactionPage(),
        closedElevation: 0,
        closedShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimens.size16),
        ),
        closedBuilder: (ctx, openContainer) => FloatingActionButton(
          onPressed: openContainer,
          child: Icon(Icons.add),
        ),
        transitionDuration: Durations.long2,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:smoney/core/common/common.export.dart';

class TransactionWidget extends StatelessWidget {
  const TransactionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Card.filled(
        color: context.colorScheme.primaryContainer,
        margin: EdgeInsets.symmetric(horizontal: Dimens.size12),
        child: Padding(
          padding: EdgeInsets.all(Dimens.size16),
          child: Column(
            children: [
              Text(
                context.l10n.netWorth,
                style: context.textTheme.titleMedium,
              ),
              Text('6.000.000 VND', style: context.textTheme.titleLarge),
              Text(
                '2 ${context.l10n.transactions.toLowerCase()}',
                style: context.textTheme.bodySmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

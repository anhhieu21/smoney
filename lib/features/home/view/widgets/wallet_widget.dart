import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:smoney/core/common/common.export.dart';

class WalletWidget extends StatelessWidget {
  const WalletWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Row(
        children: [
          Card.outlined(
            margin: EdgeInsets.all(Dimens.size12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Dimens.size16),
              side: BorderSide(
                color: context.colorScheme.primary,
                width: Dimens.size2,
              ),
            ),
            child: Container(
              width: context.screenWidth * 0.5 - Dimens.size12,
              padding: EdgeInsets.all(Dimens.size16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'MB Bank',
                    style: context.textTheme.titleMedium,
                  ),
                  Text(
                    '6.000.000 VND',
                    style: context.textTheme.titleMedium,
                  ),
                  Text(
                    '2 ${context.l10n.transactions.toLowerCase()}',
                    style: context.textTheme.bodySmall,
                  ),
                ],
              ),
            ),
          ),
          Card.outlined(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Dimens.size16),
              side: BorderSide(
                color: context.colorScheme.primary.withValues(alpha: 0.8),
                width: Dimens.size2,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(Dimens.size16),
              child: Column(
                children: [
                  Icon(MingCute.wallet_3_line),
                  Text(context.l10n.wallet)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

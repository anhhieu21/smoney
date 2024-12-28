import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:smoney/core/common/common.export.dart';

enum BotMenuEnum {
  account,
  budget,
  category,
  title,
}

extension BotMenuEnumExtension on BotMenuEnum {
  IconData get icon {
    switch (this) {
      case BotMenuEnum.account:
        return MingCute.wallet_2_fill;
      case BotMenuEnum.budget:
        return MingCute.chart_pie_2_fill;
      case BotMenuEnum.category:
        return Icons.category_rounded;
      case BotMenuEnum.title:
        return MingCute.text_2_fill;
    }
  }

  String getTitle(BuildContext context) {
    switch (this) {
      case BotMenuEnum.account:
        return context.l10n.account;
      case BotMenuEnum.budget:
        return context.l10n.budget;
      case BotMenuEnum.category:
        return context.l10n.category;
      case BotMenuEnum.title:
        return context.l10n.title;
    }
  }
}

class BotMenu extends StatelessWidget {
  const BotMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final itemSize = context.screenWidth / 4 - Dimens.size4;
    return SliverPadding(
      padding: EdgeInsets.all(Dimens.size8),
      sliver: SliverToBoxAdapter(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: Dimens.size8,
          children: BotMenuEnum.values
              .map(
                (item) => Expanded(
                  child: SizedBox(
                    height: itemSize,
                    child: ListTile(
                      onTap: () {},
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(Dimens.size8),
                        side: BorderSide(
                          color: context.colorScheme.primary
                              .withValues(alpha: 0.8),
                          width: 2,
                        ),
                      ),
                      title: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(item.icon),
                          Text(
                            item.getTitle(context),
                            overflow: TextOverflow.ellipsis,
                            softWrap: true,
                            maxLines: 1,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      contentPadding: EdgeInsets.zero,
                      titleTextStyle: context.textTheme.bodySmall
                          ?.copyWith(fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

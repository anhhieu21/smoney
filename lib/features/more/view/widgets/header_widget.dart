import 'package:animate_gradient/animate_gradient.dart';
import 'package:flutter/material.dart';
import 'package:smoney/core/common/common.export.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        margin: EdgeInsets.all(Dimens.size8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimens.size8),
          boxShadow: [
            BoxShadow(
              color: context.colorScheme.secondary.withValues(alpha: 0.5),
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
              onTap: () {},
              title: Text(context.l10n.login),
              titleTextStyle: context.textTheme.titleLarge,
              subtitle: Text(context.l10n.moreSubtitle),
            ),
          ),
        ),
      ),
    );
  }
}

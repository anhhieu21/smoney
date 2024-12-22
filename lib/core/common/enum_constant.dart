import 'package:flutter/widgets.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:smoney/core/common/common.export.dart';

/// Enum for Navigation Bottom
enum NavBottomEnum {
  home(icon: MingCute.classify_2_line, title: 'Home'),
  transaction(icon: MingCute.card_pay_line, title: 'Transaction'),
  budget(icon: MingCute.chart_pie_2_line, title: 'Budget'),
  more(icon: MingCute.dots_vertical_fill, title: 'More');

  final String title;
  final IconData icon;

  const NavBottomEnum({
    required this.title,
    required this.icon,
  });
}

extension NavBottomEnumExtension on NavBottomEnum {
  String getTitle(BuildContext context) {
    switch (this) {
      case NavBottomEnum.home:
        return context.l10n.home; // Replace with localized string
      case NavBottomEnum.transaction:
        return context.l10n.transactions; // Replace with localized string
      case NavBottomEnum.budget:
        return context.l10n.budget; // Replace with localized string
      case NavBottomEnum.more:
        return context.l10n.more; // Replace with localized string
    }
  }
}

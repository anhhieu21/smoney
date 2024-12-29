import 'package:flutter/widgets.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:smoney/core/common/common.export.dart';

/// Enum for Navigation Bottom
enum NavBottomEnum {
  home(icon: MingCute.classify_2_line),
  transaction(icon: MingCute.card_pay_line),
  budget(icon: MingCute.chart_pie_2_line),
  more(icon: MingCute.dots_vertical_fill);

  final IconData icon;

  const NavBottomEnum({
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

  IconData selectIcon(BuildContext context) {
    switch (this) {
      case NavBottomEnum.home:
        return MingCute.classify_2_fill;
      case NavBottomEnum.transaction:
        return MingCute.card_pay_fill;
      case NavBottomEnum.budget:
        return MingCute.chart_pie_2_fill;
      case NavBottomEnum.more:
        return MingCute.dots_vertical_fill;
    }
  }
}

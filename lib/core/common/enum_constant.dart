import 'package:flutter/widgets.dart';
import 'package:icons_plus/icons_plus.dart';

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

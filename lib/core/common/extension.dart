import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension BuildContextExt on BuildContext {
  /// Extension for ThemeData
  ThemeData get theme => Theme.of(this);

  /// Extension for ColorScheme
  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  /// Extension for TextTheme
  TextTheme get textTheme => Theme.of(this).textTheme;

  /// Screen size
  Size get screenSize => MediaQuery.sizeOf(this);

  /// Screen width
  double get screenWidth => screenSize.width;

  /// Screen height
  double get screenHeight => screenSize.height;

  /// Extension for AppLocalizations
  AppLocalizations get l10n => AppLocalizations.of(this)!;
}

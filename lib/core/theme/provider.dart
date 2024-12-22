import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'theme.dart';
import 'util.dart';

final themeProvider =
    NotifierProvider<ThemeProvider, ThemeData>(ThemeProvider.new);

class ThemeProvider extends Notifier<ThemeData> {
  final brightness = PlatformDispatcher.instance.platformBrightness;
  final textTheme = createTextTheme("Poppins", "Poppins");

  @override
  ThemeData build() {
    MaterialTheme theme = MaterialTheme(textTheme);
    return brightness == Brightness.light ? theme.light() : theme.dark();
  }

  void changeTheme(ThemeData theme) {
    state = theme;
  }
}

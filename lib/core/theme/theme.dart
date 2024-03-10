import 'package:flutter/material.dart';

import 'app_bar_theme.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get light => ThemeData(
        appBarTheme: CustomAppBarTheme.instance,
      );
}

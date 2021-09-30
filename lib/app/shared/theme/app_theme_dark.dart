import 'package:flutter/material.dart';

const Color _accentColor = Colors.teal;

final _appThemeBase = ThemeData.dark();

final appThemeDark = _appThemeBase.copyWith(
  colorScheme: _appThemeBase.colorScheme.copyWith(secondary: _accentColor),
);

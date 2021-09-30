import 'package:flutter/material.dart';

const Color _accentColor = Colors.teal;

final _appThemeBase = ThemeData(
  brightness: Brightness.light,
  primarySwatch: Colors.blueGrey,
  primaryIconTheme: const IconThemeData(color: _accentColor),
);

final appThemeLight = _appThemeBase.copyWith(
  colorScheme: _appThemeBase.colorScheme.copyWith(secondary: _accentColor),
);

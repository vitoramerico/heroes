import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:heroes/app/shared/theme/app_theme_dark.dart';

import 'shared/theme/app_theme_light.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Heroes',
      theme: appThemeLight,
      darkTheme: appThemeDark,
      initialRoute: Modular.initialRoute,
    ).modular();
  }
}

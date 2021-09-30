import 'package:flutter_modular/flutter_modular.dart';

import 'modules/hero/presenter/hero_module.dart';
import 'shared/connect/dio_connect.dart';
import 'shared/connect/dio_connect_interface.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton<IDioConnect>((i) => DioConnect(), export: true),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: HeroModule()),
  ];
}

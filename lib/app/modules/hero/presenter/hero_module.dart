import 'package:flutter_modular/flutter_modular.dart';
import 'package:heroes/app/modules/hero/presenter/pages/hero_details/hero_details_page.dart';
import 'package:heroes/app/shared/routes/app_routes.dart';

import '../domain/repositories/i_hero_repository.dart';
import '../domain/usecases/hero_find_by_filter/hero_find_by_filter.dart';
import '../domain/usecases/hero_find_by_filter/i_hero_find_by_filter.dart';
import '../external/datasouces/hero_datasource.dart';
import '../infra/datasources/i_hero_datasource.dart';
import '../infra/repositories/hero_repository.dart';
import 'pages/hero/hero_page.dart';
import 'stores/hero_filter_store.dart';
import 'stores/hero_list_store.dart';

class HeroModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton<IHeroDatasource>((i) => HeroDatasource(i.get())),
    Bind.lazySingleton<IHeroRepository>((i) => HeroRepository(i.get())),
    Bind.lazySingleton<IHeroFindByFilter>((i) => HeroFindByFilter(i.get())),
    Bind.lazySingleton((i) => HeroFilterStore()),
    Bind.lazySingleton((i) => HeroListStore(i.get())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => const HeroPage()),
    ChildRoute(Paths.heroDetails, child: (_, args) => HeroDetailsPage(hero: args.data)),
  ];
}

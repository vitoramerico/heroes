import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:heroes/app/modules/hero/domain/repositories/i_hero_repository.dart';
import 'package:heroes/app/modules/hero/domain/usecases/hero_find_by_filter/hero_find_by_filter.dart';
import 'package:heroes/app/modules/hero/domain/usecases/hero_find_by_filter/i_hero_find_by_filter.dart';
import 'package:heroes/app/modules/hero/infra/repositories/hero_repository.dart';
import 'package:heroes/app/modules/hero/presenter/hero_module.dart';
import 'package:mockito/annotations.dart';
import 'package:modular_test/modular_test.dart';

import 'hero_find_by_filter_test.mocks.dart';

@GenerateMocks([HeroRepository])
void main() {
  setUpAll(() {
    initModules([
      HeroModule()
    ], replaceBinds: [
      Bind.singleton<IHeroRepository>((i) => MockHeroRepository()),
    ]);
  });

  test('deve estar com todas as instancias injetadas', () {
    final repository = Modular.get<IHeroRepository>();
    final heroFindByFilter = Modular.get<IHeroFindByFilter>();

    expect(repository, isA<MockHeroRepository>());
    expect(heroFindByFilter, isA<HeroFindByFilter>());
  });

  // test('deve retornar uma lista com os resultados', () async {
  //   final repository = Modular.get<MockHeroRepository>();
  //   final heroFindByFilter = Modular.get<IHeroFindByFilter>();

  //   when(repository.findByName(any)).thenAnswer((_) => Future.value(List.empty()));

  //   var result = await heroFindByFilter('batman');

  //   expect(result, isA<List<HeroEntity>>());
  // });
}

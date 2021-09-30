import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:heroes/app/modules/hero/domain/entities/hero_entity.dart';
import 'package:heroes/app/modules/hero/domain/entities/hero_filter_entity.dart';
import 'package:heroes/app/modules/hero/domain/errors/errors.dart';
import 'package:heroes/app/modules/hero/domain/usecases/hero_find_by_filter/hero_find_by_filter.dart';
import 'package:heroes/app/modules/hero/domain/usecases/hero_find_by_filter/i_hero_find_by_filter.dart';
import 'package:heroes/app/modules/hero/presenter/hero_module.dart';
import 'package:heroes/app/modules/hero/presenter/stores/hero_list_store.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:modular_test/modular_test.dart';
import 'package:triple_test/triple_test.dart';

import 'hero_list_store_test.mocks.dart';

class MockHeroEntity extends Mock implements HeroEntity {}

@GenerateMocks([HeroFindByFilter])
void main() {
  late MockHeroFindByFilter mockHeroFindByFilter;
  late HeroEntity fakeHero;

  setUp(() {
    initModules([
      HeroModule()
    ], replaceBinds: [
      Bind.singleton<IHeroFindByFilter>((i) => MockHeroFindByFilter()),
      Bind.factory((i) => HeroListStore(i.get())),
    ]);

    mockHeroFindByFilter = Modular.get<MockHeroFindByFilter>();

    fakeHero = MockHeroEntity();
  });

  storeTest<HeroListStore>(
    'Deve retornar uma lista',
    build: () {
      when(mockHeroFindByFilter.call(any)).thenAnswer((_) async {
        return <HeroEntity>[fakeHero];
      });

      return Modular.get<HeroListStore>();
    },
    act: (store) => store.fetchData(const HeroFilterEntity()),
    expect: () => [
      [],
      tripleLoading,
      [fakeHero],
    ],
  );

  storeTest<HeroListStore>(
    'Deve retornar um erro do tipo QueryError',
    build: () {
      when(mockHeroFindByFilter.call(any)).thenThrow(ValidationError('erro'));

      return Modular.get<HeroListStore>();
    },
    act: (store) => store.fetchData(const HeroFilterEntity()),
    expect: () => [
      [],
      tripleLoading,
      isA<QueryError>(),
    ],
  );
}

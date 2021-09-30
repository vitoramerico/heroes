import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:heroes/app/modules/hero/domain/errors/errors.dart';
import 'package:heroes/app/modules/hero/domain/repositories/i_hero_repository.dart';
import 'package:heroes/app/modules/hero/external/datasouces/hero_datasource.dart';
import 'package:heroes/app/modules/hero/infra/datasources/i_hero_datasource.dart';
import 'package:heroes/app/modules/hero/infra/repositories/hero_repository.dart';
import 'package:heroes/app/modules/hero/presenter/hero_module.dart';
import 'package:heroes/app/shared/connect/errors/http_response_error.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:modular_test/modular_test.dart';

import 'hero_repository_test.mocks.dart';

@GenerateMocks([HeroDatasource])
void main() {
  late MockHeroDatasource datasource;
  late IHeroRepository repository;

  setUpAll(() {
    initModules([
      HeroModule()
    ], replaceBinds: [
      Bind.singleton<IHeroDatasource>((i) => MockHeroDatasource()),
    ]);

    datasource = Modular.get<MockHeroDatasource>();
    repository = Modular.get<IHeroRepository>();
  });

  test('deve estar com todas as instancias injetadas', () {
    expect(datasource, isA<MockHeroDatasource>());
    expect(repository, isA<HeroRepository>());
  });

  test('deve lançar um erro do tipo DatasourceError', () async {
    when(datasource.findByName(any)).thenThrow(HttpResponseError(
      body: 'Erro desconhecido',
      statusError: 'Erro interno do servidor',
    ));

    expect(() async => await repository.findByName(''), throwsA(isA<DatasourceError>()));
  });
}

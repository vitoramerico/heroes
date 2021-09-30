import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:heroes/app/modules/hero/domain/entities/hero_appearance_entity.dart';
import 'package:heroes/app/modules/hero/domain/entities/hero_biography_entity.dart';
import 'package:heroes/app/modules/hero/domain/entities/hero_connections_entity.dart';
import 'package:heroes/app/modules/hero/domain/entities/hero_entity.dart';
import 'package:heroes/app/modules/hero/domain/entities/hero_filter_entity.dart';
import 'package:heroes/app/modules/hero/domain/entities/hero_image_entity.dart';
import 'package:heroes/app/modules/hero/domain/entities/hero_powerstats_entity.dart';
import 'package:heroes/app/modules/hero/domain/entities/hero_work_entity.dart';
import 'package:heroes/app/modules/hero/domain/errors/errors.dart';
import 'package:heroes/app/modules/hero/domain/repositories/i_hero_repository.dart';
import 'package:heroes/app/modules/hero/domain/usecases/hero_find_by_filter/hero_find_by_filter.dart';
import 'package:heroes/app/modules/hero/domain/usecases/hero_find_by_filter/i_hero_find_by_filter.dart';
import 'package:heroes/app/modules/hero/infra/repositories/hero_repository.dart';
import 'package:heroes/app/modules/hero/presenter/hero_module.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:modular_test/modular_test.dart';

import 'hero_find_by_filter_test.mocks.dart';

class MockHeroBiographyEntity extends Mock implements HeroBiographyEntity {}

class MockHeroAppearanceEntity extends Mock implements HeroAppearanceEntity {}

class MockHeroWorkEntity extends Mock implements HeroWorkEntity {}

class MockHeroConnectionsEntity extends Mock implements HeroConnectionsEntity {}

class MockHeroImageEntity extends Mock implements HeroImageEntity {}

@GenerateMocks([HeroRepository])
void main() {
  late MockHeroRepository repository;
  late IHeroFindByFilter heroFindByFilter;
  late HeroEntity fakeHero;

  setUpAll(() {
    initModules([
      HeroModule()
    ], replaceBinds: [
      Bind.singleton<IHeroRepository>((i) => MockHeroRepository()),
    ]);

    repository = Modular.get<MockHeroRepository>();
    heroFindByFilter = Modular.get<IHeroFindByFilter>();

    fakeHero = HeroEntity(
      id: '1',
      name: 'batman',
      powerstats: HeroPowerstatsEntity(
        intelligence: 0,
        strength: 0,
        speed: 0,
        durability: 0,
        power: 0,
        combat: 0,
      ),
      biography: MockHeroBiographyEntity(),
      appearance: MockHeroAppearanceEntity(),
      work: MockHeroWorkEntity(),
      connections: MockHeroConnectionsEntity(),
      image: MockHeroImageEntity(),
    );
  });

  test('deve estar com todas as instancias injetadas', () {
    expect(repository, isA<MockHeroRepository>());
    expect(heroFindByFilter, isA<HeroFindByFilter>());
  });

  test('deve retornar erro de validação do filtro', () async {
    when(repository.findByName(any)).thenAnswer((_) async => []);

    expect(
      () async => await heroFindByFilter(const HeroFilterEntity(name: '')),
      throwsA(isA<ValidationError>()),
    );
  });

  test('deve retornar uma lista com os resultados', () async {
    when(repository.findByName(any)).thenAnswer((_) async => [
          fakeHero,
        ]);

    var result = await heroFindByFilter(const HeroFilterEntity(name: 'batman'));

    expect(result, isA<List<HeroEntity>>());
    expect(result.length, 1);
  });

  test('deve retornar uma lista vazia', () async {
    var fakeHeroTwo = fakeHero.copyWith(
      id: '2',
      name: 'batman 2',
      powerstats: HeroPowerstatsEntity(
        intelligence: 10,
        strength: 10,
        speed: 10,
        durability: 10,
        power: 10,
        combat: 10,
      ),
    );

    when(repository.findByName(any)).thenAnswer((_) async => [fakeHero, fakeHeroTwo]);

    var result = await heroFindByFilter(const HeroFilterEntity(
      name: 'batman',
      intelligenceMin: 11,
      strengthMin: 11,
      speedMin: 11,
      durabilityMin: 11,
      powerMin: 11,
      combatMin: 11,
    ));

    expect(result, isA<List<HeroEntity>>());
    expect(result.length, 0);
  });

  test('deve retornar apenas os herois com inteligencia minima de 10', () async {
    var fakeHeroTwo = fakeHero.copyWith(
      id: '2',
      name: 'batman 2',
      powerstats: HeroPowerstatsEntity(intelligence: 10),
    );

    when(repository.findByName(any)).thenAnswer((_) async => [
          fakeHero,
          fakeHeroTwo,
        ]);

    var result = await heroFindByFilter(const HeroFilterEntity(
      name: 'batman',
      intelligenceMin: 10,
    ));

    expect(result, isA<List<HeroEntity>>());
    expect(result.length, 1);
    expect(result.first.name, equals(fakeHeroTwo.name));
  });

  test('deve retornar apenas os herois com inteligencia maxima de 10', () async {
    var fakeHeroTwo = fakeHero.copyWith(
      id: '2',
      name: 'batman 2',
      powerstats: HeroPowerstatsEntity(intelligence: 11),
    );

    when(repository.findByName(any)).thenAnswer((_) async => [
          fakeHero,
          fakeHeroTwo,
        ]);

    var result = await heroFindByFilter(const HeroFilterEntity(
      name: 'batman',
      intelligenceMax: 10,
    ));

    expect(result, isA<List<HeroEntity>>());
    expect(result.length, 1);
    expect(result.first.name, equals(fakeHero.name));
  });

  test('deve retornar apenas os herois com força minima de 10', () async {
    var fakeHeroTwo = fakeHero.copyWith(
      id: '2',
      name: 'batman 2',
      powerstats: HeroPowerstatsEntity(strength: 10),
    );

    when(repository.findByName(any)).thenAnswer((_) async => [
          fakeHero,
          fakeHeroTwo,
        ]);

    var result = await heroFindByFilter(const HeroFilterEntity(
      name: 'batman',
      strengthMin: 10,
    ));

    expect(result, isA<List<HeroEntity>>());
    expect(result.length, 1);
    expect(result.first.name, equals(fakeHeroTwo.name));
  });

  test('deve retornar apenas os herois com força maxima de 10', () async {
    var fakeHeroTwo = fakeHero.copyWith(
      id: '2',
      name: 'batman 2',
      powerstats: HeroPowerstatsEntity(strength: 11),
    );

    when(repository.findByName(any)).thenAnswer((_) async => [
          fakeHero,
          fakeHeroTwo,
        ]);

    var result = await heroFindByFilter(const HeroFilterEntity(
      name: 'batman',
      strengthMax: 10,
    ));

    expect(result, isA<List<HeroEntity>>());
    expect(result.length, 1);
    expect(result.first.name, equals(fakeHero.name));
  });

  test('deve retornar apenas os herois com velocidade minima de 10', () async {
    var fakeHeroTwo = fakeHero.copyWith(
      id: '2',
      name: 'batman 2',
      powerstats: HeroPowerstatsEntity(speed: 10),
    );

    when(repository.findByName(any)).thenAnswer((_) async => [
          fakeHero,
          fakeHeroTwo,
        ]);

    var result = await heroFindByFilter(const HeroFilterEntity(
      name: 'batman',
      speedMin: 10,
    ));

    expect(result, isA<List<HeroEntity>>());
    expect(result.length, 1);
    expect(result.first.name, equals(fakeHeroTwo.name));
  });

  test('deve retornar apenas os herois com velocidade maxima de 10', () async {
    var fakeHeroTwo = fakeHero.copyWith(
      id: '2',
      name: 'batman 2',
      powerstats: HeroPowerstatsEntity(speed: 11),
    );

    when(repository.findByName(any)).thenAnswer((_) async => [
          fakeHero,
          fakeHeroTwo,
        ]);

    var result = await heroFindByFilter(const HeroFilterEntity(
      name: 'batman',
      speedMax: 10,
    ));

    expect(result, isA<List<HeroEntity>>());
    expect(result.length, 1);
    expect(result.first.name, equals(fakeHero.name));
  });

  test('deve retornar apenas os herois com durabilidade minima de 10', () async {
    var fakeHeroTwo = fakeHero.copyWith(
      id: '2',
      name: 'batman 2',
      powerstats: HeroPowerstatsEntity(durability: 10),
    );

    when(repository.findByName(any)).thenAnswer((_) async => [
          fakeHero,
          fakeHeroTwo,
        ]);

    var result = await heroFindByFilter(const HeroFilterEntity(
      name: 'batman',
      durabilityMin: 10,
    ));

    expect(result, isA<List<HeroEntity>>());
    expect(result.length, 1);
    expect(result.first.name, equals(fakeHeroTwo.name));
  });

  test('deve retornar apenas os herois com durabilidade maxima de 10', () async {
    var fakeHeroTwo = fakeHero.copyWith(
      id: '2',
      name: 'batman 2',
      powerstats: HeroPowerstatsEntity(durability: 11),
    );

    when(repository.findByName(any)).thenAnswer((_) async => [
          fakeHero,
          fakeHeroTwo,
        ]);

    var result = await heroFindByFilter(const HeroFilterEntity(
      name: 'batman',
      durabilityMax: 10,
    ));

    expect(result, isA<List<HeroEntity>>());
    expect(result.length, 1);
    expect(result.first.name, equals(fakeHero.name));
  });

  test('deve retornar apenas os herois com poder minimo de 10', () async {
    var fakeHeroTwo = fakeHero.copyWith(
      id: '2',
      name: 'batman 2',
      powerstats: HeroPowerstatsEntity(power: 10),
    );

    when(repository.findByName(any)).thenAnswer((_) async => [
          fakeHero,
          fakeHeroTwo,
        ]);

    var result = await heroFindByFilter(const HeroFilterEntity(
      name: 'batman',
      powerMin: 10,
    ));

    expect(result, isA<List<HeroEntity>>());
    expect(result.length, 1);
    expect(result.first.name, equals(fakeHeroTwo.name));
  });

  test('deve retornar apenas os herois com poder maximo de 10', () async {
    var fakeHeroTwo = fakeHero.copyWith(
      id: '2',
      name: 'batman 2',
      powerstats: HeroPowerstatsEntity(power: 11),
    );

    when(repository.findByName(any)).thenAnswer((_) async => [
          fakeHero,
          fakeHeroTwo,
        ]);

    var result = await heroFindByFilter(const HeroFilterEntity(
      name: 'batman',
      powerMax: 10,
    ));

    expect(result, isA<List<HeroEntity>>());
    expect(result.length, 1);
    expect(result.first.name, equals(fakeHero.name));
  });

  test('deve retornar apenas os herois com combate minimo de 10', () async {
    var fakeHeroTwo = fakeHero.copyWith(
      id: '2',
      name: 'batman 2',
      powerstats: HeroPowerstatsEntity(combat: 10),
    );

    when(repository.findByName(any)).thenAnswer((_) async => [
          fakeHero,
          fakeHeroTwo,
        ]);

    var result = await heroFindByFilter(const HeroFilterEntity(
      name: 'batman',
      combatMin: 10,
    ));

    expect(result, isA<List<HeroEntity>>());
    expect(result.length, 1);
    expect(result.first.name, equals(fakeHeroTwo.name));
  });

  test('deve retornar apenas os herois com combate maximo de 10', () async {
    var fakeHeroTwo = fakeHero.copyWith(
      id: '2',
      name: 'batman 2',
      powerstats: HeroPowerstatsEntity(combat: 11),
    );

    when(repository.findByName(any)).thenAnswer((_) async => [
          fakeHero,
          fakeHeroTwo,
        ]);

    var result = await heroFindByFilter(const HeroFilterEntity(
      name: 'batman',
      combatMax: 10,
    ));

    expect(result, isA<List<HeroEntity>>());
    expect(result.length, 1);
    expect(result.first.name, equals(fakeHero.name));
  });
}

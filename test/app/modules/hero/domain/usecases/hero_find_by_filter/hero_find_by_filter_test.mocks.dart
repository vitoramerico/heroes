// Mocks generated by Mockito 5.0.16 from annotations
// in heroes/test/app/modules/hero/domain/usecases/hero_find_by_filter/hero_find_by_filter_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:heroes/app/modules/hero/domain/entities/hero_entity.dart'
    as _i5;
import 'package:heroes/app/modules/hero/infra/datasources/i_hero_datasource.dart'
    as _i2;
import 'package:heroes/app/modules/hero/infra/repositories/hero_repository.dart'
    as _i3;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeIHeroDatasource_0 extends _i1.Fake implements _i2.IHeroDatasource {}

/// A class which mocks [HeroRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockHeroRepository extends _i1.Mock implements _i3.HeroRepository {
  MockHeroRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.IHeroDatasource get datasource =>
      (super.noSuchMethod(Invocation.getter(#datasource),
          returnValue: _FakeIHeroDatasource_0()) as _i2.IHeroDatasource);
  @override
  _i4.Future<List<_i5.HeroEntity>> findByName(String? name) =>
      (super.noSuchMethod(Invocation.method(#findByName, [name]),
              returnValue:
                  Future<List<_i5.HeroEntity>>.value(<_i5.HeroEntity>[]))
          as _i4.Future<List<_i5.HeroEntity>>);
  @override
  String toString() => super.toString();
}

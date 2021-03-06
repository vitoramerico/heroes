// Mocks generated by Mockito 5.0.16 from annotations
// in heroes/test/app/modules/hero/presenter/stores/hero_list_store_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i3;

import 'package:heroes/app/modules/hero/domain/entities/hero_entity.dart'
    as _i4;
import 'package:heroes/app/modules/hero/domain/entities/hero_filter_entity.dart'
    as _i5;
import 'package:heroes/app/modules/hero/domain/usecases/hero_find_by_filter/hero_find_by_filter.dart'
    as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

/// A class which mocks [HeroFindByFilter].
///
/// See the documentation for Mockito's code generation for more information.
class MockHeroFindByFilter extends _i1.Mock implements _i2.HeroFindByFilter {
  MockHeroFindByFilter() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<List<_i4.HeroEntity>> call(_i5.HeroFilterEntity? filter) =>
      (super.noSuchMethod(Invocation.method(#call, [filter]),
              returnValue:
                  Future<List<_i4.HeroEntity>>.value(<_i4.HeroEntity>[]))
          as _i3.Future<List<_i4.HeroEntity>>);
  @override
  String toString() => super.toString();
}

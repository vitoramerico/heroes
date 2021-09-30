import "package:collection/collection.dart";
import 'package:flutter_triple/flutter_triple.dart';
import 'package:heroes/app/modules/hero/domain/entities/hero_entity.dart';
import 'package:heroes/app/modules/hero/domain/errors/errors.dart';

class HeroListSamePowerStore extends NotifierStore<QueryError, Map<int, List<HeroEntity>>> {
  HeroListSamePowerStore() : super({});

  void fetchData(List<HeroEntity> lstHero) {
    execute(() async {
      var newMap = groupBy(lstHero, (HeroEntity obj) => obj.hashCode);
      newMap.removeWhere((key, value) => value.length < 2);

      return newMap;
    });
  }
}

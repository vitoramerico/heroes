import 'package:flutter_triple/flutter_triple.dart';
import 'package:heroes/app/modules/hero/domain/entities/hero_entity.dart';
import 'package:heroes/app/modules/hero/domain/entities/hero_filter_entity.dart';
import 'package:heroes/app/modules/hero/domain/errors/errors.dart';
import 'package:heroes/app/modules/hero/domain/usecases/hero_find_by_filter/i_hero_find_by_filter.dart';

class HeroListStore extends NotifierStore<QueryError, List<HeroEntity>> {
  final IHeroFindByFilter _heroFindByFilter;

  HeroListStore(this._heroFindByFilter) : super(List.empty());

  void fetchData(HeroFilterEntity filter) {
    execute(() async {
      var lstHero = await _heroFindByFilter(filter);
      return lstHero;
    });
  }
}

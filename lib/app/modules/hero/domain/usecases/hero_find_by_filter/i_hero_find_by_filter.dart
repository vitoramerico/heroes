import 'package:heroes/app/modules/hero/domain/entities/hero_entity.dart';
import 'package:heroes/app/modules/hero/domain/entities/hero_filter_entity.dart';

abstract class IHeroFindByFilter {
  Future<List<HeroEntity>> call(HeroFilterEntity filter);
}

import 'package:heroes/app/modules/hero/domain/entities/hero_entity.dart';

abstract class IHeroRepository {
  Future<List<HeroEntity>> findByName(String name);
}

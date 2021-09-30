import 'package:heroes/app/modules/hero/domain/entities/hero_entity.dart';
import 'package:heroes/app/modules/hero/domain/entities/hero_filter_entity.dart';
import 'package:heroes/app/modules/hero/domain/errors/errors.dart';
import 'package:heroes/app/modules/hero/domain/repositories/i_hero_repository.dart';

import 'i_hero_find_by_filter.dart';

class HeroFindByFilter implements IHeroFindByFilter {
  final IHeroRepository _repository;

  HeroFindByFilter(this._repository);

  @override
  Future<List<HeroEntity>> call(HeroFilterEntity filter) async {
    if (!filter.isValid) throw ValidationError('Digite o nome de um herói para buscar');

    var lstHero = await _repository.findByName(filter.name);

    var lstFiltered = lstHero
        .where((v) =>
            v.powerstats.intelligence >= filter.intelligenceMin &&
            v.powerstats.intelligence <= filter.intelligenceMax &&
            v.powerstats.strength >= filter.strengthMin &&
            v.powerstats.strength <= filter.strengthMax &&
            v.powerstats.speed >= filter.speedMin &&
            v.powerstats.speed <= filter.speedMax &&
            v.powerstats.durability >= filter.durabilityMin &&
            v.powerstats.durability <= filter.durabilityMax &&
            v.powerstats.power >= filter.powerMin &&
            v.powerstats.power <= filter.powerMax &&
            v.powerstats.combat >= filter.combatMin &&
            v.powerstats.combat <= filter.combatMax)
        .toList();

    return lstFiltered;
  }
}

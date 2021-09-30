import 'package:heroes/app/modules/hero/infra/models/hero_filter_model.dart';
import 'package:heroes/app/modules/hero/infra/models/hero_model.dart';

abstract class IHeroDatasource {
  Future<List<HeroModel>> findByFilter(HeroFilterModel filter);
}

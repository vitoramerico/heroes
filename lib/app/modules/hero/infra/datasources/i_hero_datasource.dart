import 'package:heroes/app/modules/hero/infra/models/hero_model.dart';

abstract class IHeroDatasource {
  Future<List<HeroModel>> findByName(String name);
}

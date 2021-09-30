import 'package:heroes/app/modules/hero/domain/entities/hero_entity.dart';
import 'package:heroes/app/modules/hero/domain/repositories/i_hero_repository.dart';
import 'package:heroes/app/modules/hero/infra/datasources/i_hero_datasource.dart';

import '../../../../shared/connect/errors/http_response_error.dart';
import '../../domain/errors/errors.dart';

class HeroRepository implements IHeroRepository {
  final IHeroDatasource datasource;

  HeroRepository(this.datasource);

  @override
  Future<List<HeroEntity>> findByName(String name) async {
    try {
      var lstHeroModel = await datasource.findByName(name);

      var lstHeroEntity = lstHeroModel.map((v) => v.toEntity()).toList();

      return lstHeroEntity;
    } on HttpResponseError catch (error) {
      throw DatasourceError(error.message);
    } catch (error) {
      throw DatasourceError(error.toString());
    }
  }
}

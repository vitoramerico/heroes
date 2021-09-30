import 'package:heroes/app/modules/hero/domain/entities/hero_entity.dart';
import 'package:heroes/app/modules/hero/domain/entities/hero_filter_entity.dart';
import 'package:heroes/app/modules/hero/domain/repositories/i_hero_repository.dart';
import 'package:heroes/app/modules/hero/infra/datasources/i_hero_datasource.dart';
import 'package:heroes/app/modules/hero/infra/models/hero_filter_model.dart';

import '../../../../shared/connect/errors/http_response_error.dart';
import '../../domain/errors/errors.dart';

class HeroRepository implements IHeroRepository {
  final IHeroDatasource datasource;

  HeroRepository(this.datasource);

  @override
  Future<List<HeroEntity>> findByFilter(HeroFilterEntity filter) async {
    try {
      var filterModel = HeroFilterModel.fromEntity(filter);

      var lstHeroModel = await datasource.findByFilter(filterModel);

      var lstHeroEntity = lstHeroModel.map((v) => v.toEntity()).toList();

      return lstHeroEntity;
    } on HttpResponseError catch (error) {
      throw DatasourceError(error.message);
    } catch (error) {
      throw DatasourceError(error.toString());
    }
  }
}

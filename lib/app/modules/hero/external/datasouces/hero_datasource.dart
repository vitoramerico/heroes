import 'package:dio/dio.dart';
import 'package:heroes/app/modules/hero/infra/datasources/i_hero_datasource.dart';
import 'package:heroes/app/modules/hero/infra/models/hero_model.dart';
import 'package:heroes/app/modules/hero/infra/models/hero_filter_model.dart';
import 'package:heroes/app/shared/connect/dio_connect_interface.dart';
import 'package:heroes/app/shared/connect/models/response_data.dart';

import '../../../../shared/connect/errors/http_response_error.dart';

class HeroDatasource implements IHeroDatasource {
  final IDioConnect _dioConnect;

  HeroDatasource(this._dioConnect);

  @override
  Future<List<HeroModel>> findByFilter(HeroFilterModel filter) async {
    try {
      var client = _dioConnect.instance;

      var response = await client.get('/search/${filter.name}');

      var responseData = ResponseDataModel.fromMap(response.data);

      if (responseData.hasError) {
        throw HttpResponseError(body: responseData.error, statusError: response.statusMessage);
      }

      List<dynamic> results = responseData.results;

      return results.map((v) => HeroModel.fromMap(v)).toList();
    } on DioError catch (error) {
      throw HttpResponseError(body: error.message, statusError: error.response?.statusMessage);
    }
  }
}

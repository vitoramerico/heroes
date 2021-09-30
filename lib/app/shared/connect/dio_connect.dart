import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:heroes/app/shared/utils/string_constants.dart';

import 'dio_connect_interface.dart';

class DioConnect implements IDioConnect {
  late Dio _dio;

  DioConnect() {
    _dio = Dio();

    var serverUrl = dotenv.env[StringConstants.serverUrl] ?? '';
    var serverAccessToken = dotenv.env[StringConstants.serverAccessToken] ?? '';

    var baseUrl = '$serverUrl/$serverAccessToken';

    _dio.options = BaseOptions(baseUrl: baseUrl);
  }

  @override
  Dio get instance => _dio;
}

import 'package:dio/dio.dart';
import '../models/custom_error.dart';

import '../models/translation.dart';
import '../constants.dart';

class TranslationApiService {
  late Dio _dio;
  TranslationApiService() {
    _dio = Dio();
    _dio.options.baseUrl = apiURL;
    _dio.options.method = 'GET';
    _dio.options.connectTimeout = 10000;
    _dio.options.receiveTimeout = 8000;
    _dio.options.responseType = ResponseType.json;
  }

  Future<Translation?> getTranslation(String word) async {
    Translation? translation;
    try {
      Response response = await _dio.request(
        '/$word',
      );
      if (response.statusCode == 404) {
        translation = null;
      } else {
        translation = Translation.fromMap(response.data[0]);
      }
    } on DioError catch (e) {
      throw CustomError(
        code: 'Exception',
        message: e.toString(),
        plugin: 'translation_api/getTranslation',
      );
    }
    return translation;
  }
}

import 'package:dio/dio.dart';

import '../../../../core/const/api_header.dart';
import '../../../../core/const/string.dart';

class GeoService {
  GeoService(Dio dio) : _dio = dio;

  final Dio _dio;

  Future<Response> getProv() async {
    return await _dio.get(
      geoBaseUrl + geoProvEndPoint,
      options: Options(
        headers: geoHeader,
      ),
    );
  }

  Future<Response> getCity(String provId) async {
    return await _dio.get(
      geoBaseUrl + geoCityEndPoint,
      queryParameters: {
        'provinsi_id': provId,
      },
      options: Options(
        headers: geoHeader,
      ),
    );
  }
}

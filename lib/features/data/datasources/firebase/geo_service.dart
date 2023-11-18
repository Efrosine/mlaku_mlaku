import 'package:dio/dio.dart';

class GeoService {
  GeoService(Dio dio) : _dio = dio;

  final Dio _dio;

  Future<Response> getProv() async {
    return await _dio.get(
      'https://api.goapi.io/regional/provinsi',
      options: Options(
        headers: {
          'X-API-KEY': '2f428b6a-d208-5689-1ea1-644f92e4',
        },
      ),
    );
  }

  Future<Response> getCity(String provId) async {
    return await _dio.get(
      'https://api.goapi.io/regional/kota?provinsi_id=$provId',
      options: Options(
        headers: {
          'X-API-KEY': '2f428b6a-d208-5689-1ea1-644f92e4',
        },
      ),
    );
  }
}

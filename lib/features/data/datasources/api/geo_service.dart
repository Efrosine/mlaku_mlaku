import 'package:dio/dio.dart';

class GeoService {
  GeoService(Dio dio) : _dio = dio;

  final Dio _dio;

  Future<Response> getProv() async {
    return await _dio.get(
      'https://emsifa.github.io/api-wilayah-indonesia/api/provinces.json',
    );
  }

  Future<Response> getCity(String provId) async {
    return await _dio.get(
      'https://emsifa.github.io/api-wilayah-indonesia/api/regencies/$provId.json',
    );
  }
}

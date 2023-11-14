import 'package:dio/dio.dart';
import 'package:mlaku_mlaku/features/data/model/geo_model.dart';

import '../../../../core/datastate/datastate.dart';

class GeoService {
  GeoService(Dio dio) : _dio = dio;

  final Dio _dio;

//create fetch api using dio return respons
// base api https://api.goapi.io
//end point /region/provinsi
// header  X-API-KEY =2f428b6a-d208-5689-1ea1-644f92e4

  Future<Response> getProv() async {
    return await _dio.get(
      'https://api.goapi.io/api/v1/region/provinsi',
      options: Options(
        headers: {
          'X-API-KEY': '2f428b6a-d208-5689-1ea1-644f92e4',
        },
      ),
    );
    // try {
    //   final response = await _dio.get(
    //     'https://api.goapi.io/api/v1/region/provinsi',
    //     options: Options(
    //       headers: {
    //         'X-API-KEY': '2f428b6a-d208-5689-1ea1-644f92e4',
    //       },
    //     ),
    //   );
    //   final data = response.data['data'] as List;
    //   final result = data.map((e) => GeoModel.fromJson(e)).toList();
    //   return DataSuccess(result);
    // } on DioError catch (e) {
    //   return DataError(e);
    // } catch (e) {
    //   return DataError(e);
    // }
  }

  Future<Response> getCity(String provId) async {
    return await _dio.get(
      'https://api.goapi.io/api/v1/region/kabupaten?id_provinsi=$provId',
      options: Options(
        headers: {
          'X-API-KEY': '2f428b6a-d208-5689-1ea1-644f92e4',
        },
      ),
    );
    // try {
    //   final response = await _dio.get(
    //     'https://api.goapi.io/api/v1/region/kabupaten?id_provinsi=$provId',
    //     options: Options(
    //       headers: {
    //         'X-API-KEY': '2f428b6a-d208-5689-1ea1-644f92e4',
    //       },
    //     ),
    //   );
    //   final data = response.data['data'] as List;
    //   final result = data.map((e) => GeoModel.fromJson(e)).toList();
    //   return DataSuccess(result);
    // } on DioError catch (e) {
    //   return DataError(e);
    // } catch (e) {
    //   return DataError(e);
    // }
  }
}

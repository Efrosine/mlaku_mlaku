import 'package:dio/dio.dart';
import 'package:mlaku_mlaku/core/datastate/datastate.dart';
import 'package:mlaku_mlaku/features/data/datasources/firebase/geo_service.dart';
import 'package:mlaku_mlaku/features/data/model/geo_model.dart';
import 'package:mlaku_mlaku/features/domain/entities/geo_ent.dart';
import 'package:mlaku_mlaku/features/domain/repositories/geo_repo.dart';

class GeoRepoImpl extends GeoRepo {
  final GeoService _service;

  GeoRepoImpl(this._service);
  @override
  Future<DataState<List<GeoModel>, void>> getCity(String provId) async {
    try {
      final respon = await _service.getCity(provId);
      print('inistatuscode');
      print(respon.statusCode);
      final data = respon.data['data'] as List;
      final result = data.map((e) => GeoModel.fromJson(e)).toList();
      return DataSuccess(result);
    } catch (e) {
      print('ini error');
      print(e);
      return const DataError(null);
    }
  }

  @override
  Future<DataState<List<GeoModel>, void>> getProv() async {
    try {
      final respon = await _service.getProv();
      print('inistatuscode');
      print(respon.statusCode);
      final data = respon.data['data'] as List;
      final result = data.map((e) => GeoModel.fromJson(e)).toList();
      return DataSuccess(result);
    } catch (e) {
      print('ini error');
      print(e);
      return const DataError(null);
    }
  }
}

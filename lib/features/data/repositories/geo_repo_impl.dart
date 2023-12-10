import 'package:mlaku_mlaku/core/datastate/datastate.dart';

import 'package:mlaku_mlaku/features/data/datasources/api/geo_service.dart';

import 'package:mlaku_mlaku/features/data/datasources/firebase/geo_service.dart';

import 'package:mlaku_mlaku/features/data/model/geo_model.dart';
import 'package:mlaku_mlaku/features/domain/repositories/geo_repo.dart';

class GeoRepoImpl extends GeoRepo {
  GeoRepoImpl(this._service);

  final GeoService _service;

  @override
  Future<DataState<List<GeoModel>, void>> getCity(String provId) async {
    try {
      final respon = await _service.getCity(provId);

      final data = respon.data as List;

      final result = data.map((e) => GeoModel.fromJson(e)).toList();
      return DataSuccess(result);
    } catch (e) {
      return const DataError(null);
    }
  }

  @override
  Future<DataState<List<GeoModel>, void>> getProv() async {
    try {
      final respon = await _service.getProv();

      final data = respon.data as List;

      final result = data.map((e) => GeoModel.fromJson(e)).toList();
      return DataSuccess(result);
    } catch (e) {
      return const DataError(null);
    }
  }
}

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
  Future<DataState<List<GeoModel>, void>> getCity(String provId) {
    try {
      final respon = _service.getProv();
      final data = respon.data['data'] as List;
    } catch (e) {}
  }

  @override
  Future<DataState<List<GeoModel>, void>> getProv() {
    // TODO: implement getProv
    throw UnimplementedError();
  }
}

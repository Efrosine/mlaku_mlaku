import 'package:mlaku_mlaku/core/datastate/datastate.dart';
import 'package:mlaku_mlaku/features/domain/entities/geo_ent.dart';

abstract class GeoRepo {
  Future<DataState<List<GeoEntity>, void>> getProv();
  Future<DataState<List<GeoEntity>, void>> getCity(String provId);
}

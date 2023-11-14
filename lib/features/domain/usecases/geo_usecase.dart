import 'package:mlaku_mlaku/core/datastate/datastate.dart';
import 'package:mlaku_mlaku/core/usecases/usecases.dart';
import 'package:mlaku_mlaku/features/domain/entities/geo_ent.dart';
import 'package:mlaku_mlaku/features/domain/repositories/geo_repo.dart';

class GetProv extends UseCase<DataState<List<GeoEntity>, void>, void> {
  final GeoRepo _geoRepo;

  GetProv({required GeoRepo geoRepo}) : _geoRepo = geoRepo;

  @override
  Future<DataState<List<GeoEntity>, void>> call({void params}) {
    return _geoRepo.getProv();
  }
}

class GetCity extends UseCase<DataState<List<GeoEntity>, void>, String> {
  final GeoRepo _geoRepo;

  GetCity({required GeoRepo geoRepo}) : _geoRepo = geoRepo;
  @override
  Future<DataState<List<GeoEntity>, void>> call({String? params}) {
    return _geoRepo.getCity(params!);
  }
}

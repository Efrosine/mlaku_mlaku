import 'package:mlaku_mlaku/core/datastate/datastate.dart';
import 'package:mlaku_mlaku/core/usecases/usecases.dart';
import 'package:mlaku_mlaku/features/domain/entities/geo_ent.dart';
import 'package:mlaku_mlaku/features/domain/repositories/geo_repo.dart';

class GetProvUseCase extends UseCase<DataState<List<GeoEntity>, void>, void> {
  GetProvUseCase({required GeoRepo geoRepo}) : _geoRepo = geoRepo;

  final GeoRepo _geoRepo;

  @override
  Future<DataState<List<GeoEntity>, void>> call({void params}) {
    return _geoRepo.getProv();
  }
}

class GetCityUseCase extends UseCase<DataState<List<GeoEntity>, void>, String> {
  GetCityUseCase({required GeoRepo geoRepo}) : _geoRepo = geoRepo;

  final GeoRepo _geoRepo;

  @override
  Future<DataState<List<GeoEntity>, void>> call({String? params}) {
    return _geoRepo.getCity(params!);
  }
}

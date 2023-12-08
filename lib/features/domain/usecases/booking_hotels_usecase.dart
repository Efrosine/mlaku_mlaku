import 'package:mlaku_mlaku/core/datastate/datastate.dart';
import 'package:mlaku_mlaku/core/usecases/usecases.dart';
import 'package:mlaku_mlaku/features/domain/entities/hotels_ent.dart';
import 'package:mlaku_mlaku/features/domain/repositories/booking_hotels_repo.dart';

import '../entities/req_booking_ent.dart';

class GetListHotelsUseCase
    extends UseCase<DataState<List<HotelsEntity>, void>, ReqBookingEntity> {
  GetListHotelsUseCase({required BookingHotelsRepo repo}) : _repo = repo;

  final BookingHotelsRepo _repo;

  @override
  Future<DataState<List<HotelsEntity>, void>> call({ReqBookingEntity? params}) {
    return _repo.getListHotels(params!);
  }
}

class GetDetailHotelsUseCase
    extends UseCase<DataState<HotelsEntity, void>, HotelsEntity> {
  GetDetailHotelsUseCase({required BookingHotelsRepo repo}) : _repo = repo;

  final BookingHotelsRepo _repo;

  @override
  Future<DataState<HotelsEntity, void>> call({HotelsEntity? params}) {
    return _repo.getDetailHotels(params!);
  }
}

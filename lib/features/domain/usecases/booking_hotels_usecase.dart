import 'package:mlaku_mlaku/core/datastate/datastate.dart';
import 'package:mlaku_mlaku/core/usecases/usecases.dart';
import 'package:mlaku_mlaku/features/domain/entities/hotels_ent.dart';
import 'package:mlaku_mlaku/features/domain/repositories/booking_hotels_repo.dart';

import '../entities/req_booking_ent.dart';

class GetListHotels
    extends UseCase<DataState<List<HotelsEntity>, void>, ReqBookingEntity> {
  GetListHotels({required BookingHotelsRepo repo}) : _repo = repo;

  final BookingHotelsRepo _repo;

  @override
  Future<DataState<List<HotelsEntity>, void>> call({ReqBookingEntity? params}) {
    return _repo.getListHotels(params!);
  }
}

class GetDetailHotels extends UseCase<DataState<HotelsEntity, void>, HotelsEntity> {
  GetDetailHotels({required BookingHotelsRepo repo}) : _repo = repo;

  final BookingHotelsRepo _repo;

  @override
  Future<DataState<HotelsEntity, void>> call({HotelsEntity? params}) {
    return _repo.getDetailHotels(params!);
  }
}

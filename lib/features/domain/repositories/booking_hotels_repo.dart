import 'package:mlaku_mlaku/core/datastate/datastate.dart';
import 'package:mlaku_mlaku/features/domain/entities/hotels_ent.dart';

import '../entities/req_booking_ent.dart';

abstract class BookingHotelsRepo {
  Future<DataState<List<HotelsEntity>, void>> getListHotels(
      ReqBookingEntity regBookingEnt);
  Future<DataState<HotelsEntity, void>> getDetailHotels(HotelsEntity hotelsEntity);
  Future<DataState<void, void>> setReservation(HotelsEntity hotelsEntity);
  Future<DataState<List<HotelsEntity>, void>> getAllReservation();
}

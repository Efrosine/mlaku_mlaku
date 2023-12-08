import 'package:mlaku_mlaku/core/datastate/datastate.dart';
import 'package:mlaku_mlaku/features/data/datasources/api/booking_hotels_service.dart';
import 'package:mlaku_mlaku/features/data/model/hotel_model.dart';
import 'package:mlaku_mlaku/features/data/model/req_hotels_model.dart';
import 'package:mlaku_mlaku/features/domain/entities/hotels_ent.dart';
import 'package:mlaku_mlaku/features/domain/entities/req_booking_ent.dart';
import 'package:mlaku_mlaku/features/domain/repositories/booking_hotels_repo.dart';

class BookingHotelsRepoImpl extends BookingHotelsRepo {
  final BookingHotelsService _hotelsService;

  BookingHotelsRepoImpl(this._hotelsService);
  @override
  Future<DataState<HotelsEntity, void>> getDetailHotels(
      HotelsEntity hotelsEntity) {
    throw UnimplementedError();
  }

  @override
  Future<DataState<List<HotelsEntity>, void>> getListHotels(
      ReqBookingEntity regBookingEnt) async {
    try {
      final respon = await _hotelsService
          .getListHotels(ReqBookingModel.fromEntity(regBookingEnt));
      final data = respon.data['data']['hotels'] as List;
      final result = data.map((e) => HotelsModel.fromJson(e)).toList();
      return DataSuccess(result);
    } catch (e) {
      return const DataError(null);
    }
  }
}

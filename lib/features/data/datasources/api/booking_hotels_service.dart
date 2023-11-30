import 'package:dio/dio.dart';
import 'package:mlaku_mlaku/core/const/string.dart';
import 'package:mlaku_mlaku/features/data/model/req_hotels_model.dart';

import '../../../../core/const/api_header.dart';

class BookingHotelsService {
  BookingHotelsService(Dio dio) : _dio = dio;

  final Dio _dio;

  Future<Response> getListHotels(ReqBookingModel reqModel) async {
    var destination = await _dio.get(
      bookingBaseUrl + hotelsDesEndPoint,
      queryParameters: {'query': reqModel.queryByCity},
      options: Options(headers: bookingHeader),
    );
    String destId = await destination.data['data']['dest_id'];
    String searchType = await destination.data['data']['search_type'];

    return await _dio.get(
      bookingBaseUrl + hotelsListEndPoint,
      queryParameters: {
        'dest_id': destId,
        'search_type': searchType,
        'arrival_date': reqModel.arrivalDate,
        'departure_date': reqModel.departureDate,
      },
      options: Options(headers: bookingHeader),
    );
  }
}

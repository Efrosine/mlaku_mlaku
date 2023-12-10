import 'package:dio/dio.dart';
import 'package:mlaku_mlaku/features/data/model/hotel_model.dart';

import 'package:mlaku_mlaku/features/data/model/req_hotels_model.dart';

class BookingHotelsService {
  BookingHotelsService(Dio dio) : _dio = dio;

  final Dio _dio;

  Future<Response> getListHotels(ReqBookingModel reqModel) async {
    final response = await _dio.get(
      'https://booking-com15.p.rapidapi.com/api/v1/hotels/searchDestination',
      queryParameters: {'query': reqModel.queryByCity},
      options: Options(headers: {
        'X-RapidAPI-Key': '2e7aa97237msh89ce8f771546c47p1fe7acjsn105dde33f0df',
        'X-RapidAPI-Host': 'booking-com15.p.rapidapi.com',
      }),
    );
    final data = response.data['data'][0];

    String destId = data['dest_id'];
    String destType = data['dest_type'];

    return await _dio.get(
      'https://booking-com15.p.rapidapi.com/api/v1/hotels/searchHotels',
      queryParameters: {
        'dest_id': destId,
        'search_type': destType,
        'arrival_date': reqModel.arrivalDate,
        'departure_date': reqModel.departureDate,
      },
      options: Options(headers: {
        'X-RapidAPI-Key': '2e7aa97237msh89ce8f771546c47p1fe7acjsn105dde33f0df',
        'X-RapidAPI-Host': 'booking-com15.p.rapidapi.com',
      }),
    );
  }

  Future<Response> getDetailHotes(HotelsModel model) async {
    return await _dio.get(
      'https://booking-com15.p.rapidapi.com/api/v1/hotels/getDescriptionAndInfo',
      queryParameters: {
        'hotel_id': model.id.toString(),
      },
      options: Options(headers: {
        'X-RapidAPI-Key': '2e7aa97237msh89ce8f771546c47p1fe7acjsn105dde33f0df',
        'X-RapidAPI-Host': 'booking-com15.p.rapidapi.com',
      }),
    );
  }
}

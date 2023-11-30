import '../../domain/entities/req_booking_ent.dart';

class ReqBookingModel extends ReqBookingEntity {
  ReqBookingModel({
    required super.city,
    required super.province,
    required super.destId,
    required super.searchType,
    required super.arrivalDate,
    required super.departureDate,
  });

  String? get queryByCity {
    if (city != null) {
      if (city!.startsWith('KOTA ADM.') ||
          city!.startsWith('KAB. ADM.') ||
          city!.startsWith('KABUPATEN')) {
        return '${city!.substring(10)} Indonesia';
      } else if (city!.startsWith('KOTA')) {
        return '${city!.substring(5)} Indonesia';
      } else {
        return '${city!} Indonesia';
      }
    }
    return 'Indonesia';
  }

  String? get queryByProvince {
    if (province != null) {
      if (province!.startsWith('DKI')) {
        return '${province!.substring(4)} Indonesia';
      } else if (province!.startsWith('DAERAH ISTIMEWA')) {
        return '${province!.substring(16)} Indonesia';
      }
      return '${province!} Indonesia';
    }
    return 'Indonesia';
  }

  //from entity
  factory ReqBookingModel.fromEntity(ReqBookingEntity entity) {
    return ReqBookingModel(
      arrivalDate: entity.arrivalDate,
      city: entity.city,
      departureDate: entity.departureDate,
      destId: entity.destId,
      province: entity.province,
      searchType: entity.searchType,
    );
  }
}

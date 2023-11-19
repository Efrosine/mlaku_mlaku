import 'package:equatable/equatable.dart';

class ReqBookingEntity extends Equatable {
  ReqBookingEntity(
    this.city,
    this.province,
    this.destId,
    this.searchType,
    this.arrivalDate,
    this.departureDate,
  );

  String? arrivalDate;
  String? departureDate;
  String? destId;
  String? city;
  String? province;
  String? searchType;

  String? get queryByCity {
    if (city != null) {
      if (city!.startsWith('KOTA ADM.') || city!.startsWith('KAB. ADM.')) {
        return '${city!.substring(10)} Indonesia';
      } else if (city!.startsWith('KOTA') || city!.startsWith('KAB.')) {
        return '${city!.substring(5)} Indonesia';
      } else {
        return 'Indonesia';
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
      return 'Indonesia';
    }
  }

  @override
  List<Object?> get props => [
        arrivalDate,
        departureDate,
        destId,
        city,
        province,
        searchType,
      ];

  ReqBookingEntity.empty()
      : arrivalDate = null,
        departureDate = null,
        destId = null,
        city = null,
        province = null,
        searchType = null;
}

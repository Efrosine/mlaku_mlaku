import 'package:equatable/equatable.dart';

class ReqBookingEntity extends Equatable {

  ReqBookingEntity({

    this.city,
    this.province,
    this.destId,
    this.searchType,
    this.arrivalDate,
    this.departureDate,

  });


  ReqBookingEntity.empty()
      : arrivalDate = null,
        departureDate = null,
        destId = null,
        city = null,
        province = null,
        searchType = null;

  String? arrivalDate;
  String? city;
  String? departureDate;
  String? destId;
  String? province;
  String? searchType;

  @override
  List<Object?> get props => [
        arrivalDate,
        departureDate,
        destId,
        city,
        province,
        searchType,
      ];

}

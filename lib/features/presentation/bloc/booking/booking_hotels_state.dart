part of 'booking_hotels_bloc.dart';

final class BookingHotelsState extends Equatable {
  const BookingHotelsState({
    this.optionsProv,
    this.optionsCity,
    this.idFirstDes = '',
    this.firstDate,
    this.isFirstDesValid = false,
    this.isFristDateValid = false,
    this.isValid = false,
  });
  final DateTime? firstDate;
  final String idFirstDes;
  final bool isFirstDesValid, isFristDateValid, isValid;
  final List<GeoEntity>? optionsProv, optionsCity;

  @override
  List<Object> get props => [
        isFirstDesValid,
        isValid,
        idFirstDes,
        isFirstDesValid,
        firstDate ?? '',
        optionsProv ?? {},
        optionsCity ?? {},
      ];
}

final class BookingInitialState extends BookingHotelsState {
  const BookingInitialState({
    required super.optionsProv,
  });
}

final class BookingDesChangedState extends BookingHotelsState {
  const BookingDesChangedState({
    required super.optionsCity,
    required super.isFirstDesValid,
  });
}

final class BookingDateChangedState extends BookingHotelsState {
  const BookingDateChangedState({required super.firstDate});
}

final class BookingStandbyState extends BookingHotelsState {}

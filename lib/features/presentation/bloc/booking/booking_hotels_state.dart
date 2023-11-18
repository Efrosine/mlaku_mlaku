part of 'booking_hotels_bloc.dart';

final class BookingHotelsState extends Equatable {
  const BookingHotelsState(
      {this.optionsProv,
      this.optionsCity,
      this.isFirstDesValid = false,
      this.idFirstDes = '',
      this.isValid = false,
      this.firstDate});
  final DateTime? firstDate;
  final String idFirstDes;
  final bool isFirstDesValid;
  final bool isValid;
  final List<GeoEntity>? optionsProv, optionsCity;

  BookingHotelsState copyWith({
    List<GeoEntity>? options,
    DateTime? firstDate,
    String? firstDes,
    bool? isFirstDesValid,
    bool? isValid,
  }) {
    return BookingHotelsState(
      optionsProv: options ?? this.optionsProv,
      firstDate: firstDate ?? this.firstDate,
      isValid: isValid ?? this.isValid,
      idFirstDes: firstDes ?? this.idFirstDes,
      isFirstDesValid: isFirstDesValid ?? this.isFirstDesValid,
    );
  }

  @override
  List<Object> get props =>
      [isFirstDesValid, isValid, idFirstDes, firstDate ?? '', optionsProv ?? {}];
}

final class BookingInitialState extends BookingHotelsState {
  final List<GeoEntity> optionsProv;
  const BookingInitialState({required this.optionsProv});
}

final class BookingDesChangedState extends BookingHotelsState {
  final List<GeoEntity> optionsCity;
  final bool isFirstDesValid;
  const BookingDesChangedState(
      {required this.optionsCity, required this.isFirstDesValid});
}

final class BookingDateChangedState extends BookingHotelsState {
  final DateTime? firstDate;
  const BookingDateChangedState({required this.firstDate});
}

final class BookingStandbyState extends BookingHotelsState {}

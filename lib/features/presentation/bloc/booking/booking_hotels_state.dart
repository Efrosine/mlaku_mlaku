part of 'booking_hotels_bloc.dart';

final class BookingHotelsState extends Equatable {
  const BookingHotelsState(
      {this.options,
      this.isDesValid = false,
      this.firstDes = '',
      this.isValid = false,
      this.firstDate});
  final DateTime? firstDate;
  final String firstDes;
  final bool isDesValid;
  final bool isValid;
  final List<GeoEntity>? options;

  BookingHotelsState copyWith({
    List<GeoEntity>? options,
    DateTime? firstDate,
    String? firstDes,
    bool? isDesValid,
    bool? isValid,
  }) {
    return BookingHotelsState(
      options: options ?? this.options,
      firstDate: firstDate ?? this.firstDate,
      isValid: isValid ?? this.isValid,
      firstDes: firstDes ?? this.firstDes,
      isDesValid: isDesValid ?? this.isDesValid,
    );
  }

  @override
  List<Object> get props =>
      [isDesValid, isValid, firstDes, firstDate ?? '', options ?? {}];
}

final class BookingInitialState extends BookingHotelsState {
  List<GeoEntity> options;
  BookingInitialState({required this.options});
}

final class BookingDesChangedState extends BookingHotelsState {
  final String firstDes;
  final bool isDesValid;
  const BookingDesChangedState({required this.firstDes, required this.isDesValid});
}

final class BookingDateChangedState extends BookingHotelsState {
  final DateTime firstDate;
  const BookingDateChangedState({required this.firstDate});
}

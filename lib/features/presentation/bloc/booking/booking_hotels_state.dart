part of 'booking_hotels_bloc.dart';

final class BookingHotelsState extends Equatable {
  const BookingHotelsState({
    this.firstDate,
    this.isFristDateValid = false,
    this.isValid = false,
  });
  final DateTime? firstDate;

  final bool isFristDateValid, isValid;

  @override
  List<Object> get props => [
        isValid,
        firstDate ?? '',
      ];
}

final class BookingDateChangedState extends BookingHotelsState {
  const BookingDateChangedState({required super.firstDate});
}

final class BookingStandbyState extends BookingHotelsState {}

final class BookingSearchedState extends BookingHotelsState {}

final class BookingDetailState extends BookingHotelsState {}

final class BookingDoneState extends BookingHotelsState {}

part of 'booking_hotels_bloc.dart';

final class BookingHotelsState extends Equatable {
  const BookingHotelsState({
    this.firstDate,
    this.isFristDateValid = false,
    this.isValid = false,
    this.hotelsEntity,
  });
  final DateTime? firstDate;

  final bool isFristDateValid, isValid;
  final List<HotelsEntity>? hotelsEntity;

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

final class BookingNavigateToListState extends BookingHotelsState {}

final class BookingSearchedState extends BookingHotelsState {
  const BookingSearchedState({required super.hotelsEntity});
}

final class BookingDetailState extends BookingHotelsState {}

final class BookingDoneState extends BookingHotelsState {}
